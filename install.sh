#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dotfiles=(
    .bash_profile
    .condarc
    .tmux.conf
    .vimrc
    .xonshrc
    .zprofile
    .zshenv
    .zshrc
    .gitignore_global
)

for file in "${dotfiles[@]}"; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        backup="$target.bak.$(date +%s)"
        echo "Backing up existing $target -> $backup"
        mv "$target" "$backup"
    fi

    ln -sf "$source" "$target"
    echo "Linked $target -> $source"
done
