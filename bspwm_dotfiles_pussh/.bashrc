#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL="vim"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
