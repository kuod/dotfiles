#!/usr/bin/env bash
set -euo pipefail

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

    if [ ! -e "$source" ]; then
        echo "error: missing source $source" >&2
        exit 1
    fi

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        backup="$target.bak.$(date +%s)"
        echo "Backing up existing $target -> $backup"
        mv "$target" "$backup"
    fi

    ln -sfn "$source" "$target"
    echo "Linked $target -> $source"
done

# git only honors ~/.gitignore_global if core.excludesfile points at it
if ! git config --global --get core.excludesfile >/dev/null; then
    git config --global core.excludesfile "$HOME/.gitignore_global"
    echo "Set git core.excludesfile -> $HOME/.gitignore_global"
fi
