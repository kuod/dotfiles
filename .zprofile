
# .zprofile — sourced once for Zsh login shells, before .zshrc.
# Ideal for PATH and environment variables that only need to be set once per session.

# Initialize Homebrew environment variables (PATH, MANPATH, INFOPATH, etc.)
# Required on Apple Silicon Macs where Homebrew lives at /opt/homebrew instead of /usr/local.
eval "$(/opt/homebrew/bin/brew shellenv)"
