# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles, symlinked into `$HOME`. No build system or test suite — changes take effect after symlinking and sourcing the relevant file.

## Applying changes

After editing a file, reload it in the running shell:

```sh
source ~/.zshrc       # zsh interactive config
source ~/.zshenv      # zsh env vars (affects new shells)
source ~/.bash_profile  # bash login config
tmux source ~/.tmux.conf  # tmux (inside a session)
```

## Conventions

- Hardcoded `/Users/david/` paths should use `$HOME` or `~` instead — keeps files portable and avoids leaking the local username.
- `.gitconfig` is intentionally excluded from this repo (contains a personal email address). Document it separately or configure it locally.
