setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# zplug
source ~/.zplug/init.zsh

POWERLEVEL9K_IGNORE_TERM_COLORS=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "joel-porquet/zsh-dircolors-solarized", use:zsh-dircolors-solarized.zsh

# LP_DISABLED_VCS_PATH=true
# zplug "nojhan/liquidprompt", use:liquidprompt

if zplug check || zplug install; then
  zplug load
fi

# Colorful ls
case "$OSTYPE" in
  darwin*|freebsd* )
    alias ls='ls -G'
    ;;
  linux* )
    alias ls='ls --color=auto'
    ;;
esac

alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'

