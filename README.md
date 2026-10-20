# dotfiles

Personal configuration files for macOS.

## Files

| File | Purpose |
|------|---------|
| `.zshrc` | Zsh interactive shell: history, navigation, completion, fzf, aliases, prompt, internet radio, conda/Julia PATH, zsh-syntax-highlighting, zsh-autosuggestions |
| `.zprofile` | Zsh login shell: Homebrew environment (Apple Silicon `/opt/homebrew` or Intel `/usr/local`) |
| `.zshenv` | All Zsh invocations: Rust/Cargo PATH |
| `.bash_profile` | Bash login shell: conda, Julia, Rust/Cargo PATH |
| `.tmux.conf` | tmux: prefix remap to `C-a`, pane splits with `|` / `-`, `focus-events on` |
| `.vimrc` | Vim: syntax, search, indentation, Python/YAML/Markdown filetype settings |
| `.xonshrc` | Xonsh shell: conda initialization |
| `.condarc` | Conda: channel priority (`conda-forge` > `defaults`) |
| `.gitignore_global` | Global git ignore (`.DS_Store`, `.claude/settings.local.json`); install.sh sets `core.excludesfile` |
| `tests/run.sh` | Smoke tests, run under a scratch `$HOME` |
| `install.sh` | Symlinks all dotfiles into `$HOME`, backing up existing regular files |
| `LICENSE` | MIT license |

## Setup

```sh
git clone https://github.com/kuod/dotfiles.git   # any location works
cd dotfiles
./install.sh
```

`install.sh` symlinks all dotfiles into `$HOME`. An existing regular file is backed up as `<file>.bak.<epoch-seconds>` before being replaced. An existing symlink is replaced (`ln -sfn`) without a backup.

## Prerequisites (all optional; configs skip what is missing)

Homebrew, `zsh-syntax-highlighting`, `zsh-autosuggestions`, `fzf` (run `$(brew --prefix)/opt/fzf/install` to create `~/.fzf.zsh`, which `.zshrc` sources), `mplayer`/`mpg123` (radio aliases), miniconda3, rustup, juliaup.

## Testing

```sh
tests/run.sh
```

## Notable aliases

| Alias | Command |
|-------|---------|
| `..`, `...` | `cd ..`, `cd ../..` |
| `ll` | `ls -laxho` — long listing with hidden files and human-readable sizes |
| `editrc` | Edit and reload `.zshrc` in one step |
| `R` | Launch R without save-workspace prompt |
| `rstudio` | Open RStudio as a new macOS app instance |
| `kexp`, `kbxr`, `wfuv`, `kcrw`, `swissclassic`, `summitfm` | Stream internet radio stations via `mplayer`/`mpg123` |
