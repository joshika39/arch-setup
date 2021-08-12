#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
source /usr/share/git/completion/git-prompt.sh

color_LINS="\[$(tput setaf 2)\]"
color_BARS="\[$(tput setaf 6)\]"
color_USER="\[$(tput setaf 27)\]"
color_ATSG="\[$(tput setaf 220)\]"
color_CDIR="\[$(tput setaf 105)\]"
color_HOST="\[$(tput setaf 39)\]"
color_PROM="\[$(tput setaf 13)\]"
color_GIT="\[$(tput setaf 6)\]"
color_QT="\[$(tput setaf 1)\]"

RESET="\[$(tput sgr0)\]"

#TIME="${color_ATSG}[${color_USER}\A${color_ATSG}]"
#USER_HOST="${color_ATSG}[${color_USER}\u${color_ATSG}@${color_HOST}\h${color_ATSG}]"
#WDIR="${color_ATSG}[${color_CDIR}\W${color_ATSG}]"
#GIT="\$(__git_ps1 '${color_PROM}(${color_GIT}%s${color_PROM})'${color_PROM}══) ${RESET}"
#COMMAND="         ${color_PROM}╚══${GIT}${color_GIT} ${RESET}"

alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias grep='grep --color=auto'

#export PS1="${TIME} ${color_PROM}═╦═ ${USER_HOST} ${color_PROM}── ${WDIR}\n${COMMAND}"
#export PS2="${color_QT}"
LS_COLORS='di=1;35:ex=4;31:fi=0;33' ; export LS_COLORS

# Use bash-completion, if available
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \. /usr/share/bash-completion/bash_completion

# History
HISTSIZE=1000
HISTFILESIZE=1000
HISTCONTROL=erasedups

