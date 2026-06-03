
# ─── History ────────────────────────────────────────────────────────────────

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ─── Navigation ─────────────────────────────────────────────────────────────

setopt AUTO_CD
setopt AUTO_PUSHD
alias ..="cd .."
alias ...="cd ../.."

# ─── Completion ─────────────────────────────────────────────────────────────

autoload -Uz compinit && compinit

# ─── fzf ────────────────────────────────────────────────────────────────────

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ─── Aliases ────────────────────────────────────────────────────────────────

# Long listing with hidden files, human-readable sizes, and extended attributes
alias ll="ls -laxho"

# Edit and immediately reload this config in one step
alias editrc="vim ~/.zshrc && source ~/.zshrc"

# Launch R without prompting to save the workspace on exit
alias R="R --no-save"

# Open RStudio as a new macOS app instance
alias rstudio="open -n /Applications/RStudio.app"

# ─── Prompt ─────────────────────────────────────────────────────────────────

NEWLINE=$'\n'
# Format: # user@host [date|time] /current/dir >
# %n = username, %M = full hostname, %D = date, %* = time, %d = cwd
PROMPT="# %n@%M [%D|%*] %F{green}%d%f >${NEWLINE}"

# ─── Internet Radio ─────────────────────────────────────────────────────────
# Stream URLs via mplayer/mpg123. Station index: http://fmstream.org/

alias kexp="mplayer https://live-mp3-128.kexp.org:8000/kexp128.mp3"          # KEXP Seattle — indie/alternative
alias kbxr="mplayer http://playerservices.streamtheworld.com/api/livestream-redirect/KBXRFM.mp3"  # KBXR
alias wfuv="mpg123 http://onair.wfuv.org/onair-hi"                           # WFUV NYC — Americana/folk
alias kcrw="mpg123 https://kcrw.streamguys1.com/kcrw_192k_mp3_santa_barbara_internet_radio"       # KCRW LA
alias swissclassic="mpg123 http://streaming.swisstxt.ch/m/rsc_de/mp3_128"    # Swiss classical
alias summitfm="mpg123 https://securestreams2.autopo.st:1194/wapshq"         # Summit FM

# ─── Conda ──────────────────────────────────────────────────────────────────
# Managed by `conda init` — initializes the conda shell hook so that
# `conda activate <env>` works in this shell.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ─── PATH additions ─────────────────────────────────────────────────────────

# User-local binaries (e.g. pip install --user, pipx)
export PATH="$HOME/.local/bin:$PATH"

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
# juliaup manages Julia versions; its bin dir must be on PATH for `julia` to resolve.

path=("$HOME/.juliaup/bin" $path)
export PATH

# <<< juliaup initialize <<<

# ─── Plugins ────────────────────────────────────────────────────────────────

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
