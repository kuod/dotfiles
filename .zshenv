# .zshenv — sourced for every Zsh invocation (interactive, login, and scripts).
# Keep this file minimal; heavy logic here slows down all subshells and scripts.

# ─── Rust / Cargo ───────────────────────────────────────────────────────────
# Adds ~/.cargo/bin to PATH so Rust-installed binaries (rustc, cargo, etc.) are available
# in all shells, including non-interactive ones.
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
