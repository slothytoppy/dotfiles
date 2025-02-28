# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.


autoload -U compinit
compinit
alias history="history 1"
export ZSH=$HOME/.oh-my-zsh
setopt APPEND_HISTORY
setopt SHARE_HISTORY
export PATH="/home/slothy/.apps/usr/bin:$PATH"
eval "$(zoxide init zsh)"
alias cd="z $@"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
bindkey -e
export LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export ODIN_ROOT=/home/slothy/build/Odin

ZSH_THEME="robbyrussell"
PROMPT_EOL_MARK=''

eval `ssh-agent -s` 

plugins=(git zoxide z)

eval "$(oh-my-posh init zsh)"
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

alias ls="eza -A --icons=always"
alias paru="paru --bottomup --skipreview"
nv() {
   [[ $# == 0 ]] && nvim  . && return
   nvim $@
}

session-deez-widget() {
    zle reset-prompt
    BUFFER="/home/slothy/.config/session-deez"
    zle accept-line
}
zle -N session-deez-widget
bindkey ^f session-deez-widget

alias init="nv ~/.config/nvim/init.lua"
export EDITOR="nvim"
export MANPAGER='nvim +Man!' 

eval "$(fzf --zsh)"
