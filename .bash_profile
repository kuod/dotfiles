
# .bash_profile — sourced for Bash login shells (e.g. new Terminal tabs on macOS)
# Interactive non-login shells use ~/.bashrc instead; on macOS Terminal opens login shells.

# ─── Conda ──────────────────────────────────────────────────────────────────
# Managed by `conda init` — sets up the conda shell hook so `conda activate` works.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        # Fallback: just put conda's bin on PATH directly
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# ─── juliaup ────────────────────────────────────────────────────────────────
# Managed by juliaup — only prepends Julia's bin dir if it isn't already on PATH.

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:$HOME/.juliaup/bin:*)
        ;;  # already present, skip

    *)
        export PATH=$HOME/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

# ─── Rust / Cargo ───────────────────────────────────────────────────────────
# Adds ~/.cargo/bin to PATH so Rust-installed binaries (rustc, cargo, etc.) are available.
. "$HOME/.cargo/env"
