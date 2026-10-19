
# .zprofile — sourced once for Zsh login shells, before .zshrc.
# Ideal for PATH and environment variables that only need to be set once per session.

# Initialize Homebrew environment variables (PATH, MANPATH, INFOPATH, etc.)
# Required on Apple Silicon Macs where Homebrew lives at /opt/homebrew instead of /usr/local.
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    [ -x "$_brew" ] && { eval "$("$_brew" shellenv)"; break; }
done
unset _brew
