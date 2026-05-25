# dotfiles

Personal configuration files for macOS.

## Files

| File | Purpose |
|------|---------|
| `.zshrc` | Zsh interactive shell: aliases, prompt, internet radio, conda/Julia PATH |
| `.zprofile` | Zsh login shell: Homebrew environment (Apple Silicon) |
| `.zshenv` | All Zsh invocations: Rust/Cargo PATH |
| `.bash_profile` | Bash login shell: conda, Julia, Rust/Cargo PATH |
| `.tmux.conf` | tmux: prefix remap to `C-a`, pane splits with `|` / `-` |
| `.vimrc` | Vim: syntax highlighting |
| `.xonshrc` | Xonsh shell: conda initialization |
| `.condarc` | Conda: channel priority (`conda-forge` > `defaults`) |

## Setup

```sh
git clone https://github.com/kuod/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` symlinks all dotfiles into `$HOME`. Any existing file is backed up with a `.bak` extension before being replaced.

## Notable aliases

| Alias | Command |
|-------|---------|
| `ll` | `ls -laxho` — long listing with hidden files and human-readable sizes |
| `editrc` | Edit and reload `.zshrc` in one step |
| `R` | Launch R without save-workspace prompt |
| `kexp`, `wfuv`, `kcrw`, ... | Stream internet radio stations via `mplayer`/`mpg123` |
