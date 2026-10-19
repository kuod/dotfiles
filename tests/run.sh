#!/usr/bin/env bash
# Smoke tests. Runs entirely under a scratch HOME; never touches the real one.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export HOME="$(mktemp -d)"
export GIT_CONFIG_GLOBAL="$HOME/.gitconfig-test"
trap 'rm -rf "$HOME"' EXIT
fail() { echo "FAIL: $*" >&2; exit 1; }

for f in install.sh .bash_profile; do bash -n "$ROOT/$f" || fail "bash -n $f"; done
if command -v zsh >/dev/null; then
    for f in .zshrc .zshenv .zprofile; do zsh -n "$ROOT/$f" || fail "zsh -n $f"; done
fi

echo precious > "$HOME/.vimrc"
"$ROOT/install.sh" >/dev/null
[ -L "$HOME/.zshrc" ] || fail "zshrc not linked"
[ "$(cat "$HOME"/.vimrc.bak.* )" = precious ] || fail "backup missing"
[ "$(git config --global core.excludesfile)" = "$HOME/.gitignore_global" ] || fail "excludesfile"
"$ROOT/install.sh" >/dev/null || fail "not idempotent"

out="$(bash -c '. "$HOME/.bash_profile"' 2>&1 || true)"
case "$out" in *"No such file"*) fail "bash_profile noisy: $out";; esac
echo "OK"
