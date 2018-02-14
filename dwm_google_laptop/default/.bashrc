#!/bin/bash
PS1="\n\e[1;37m\]\A\\n\[\e[0;34m\]┌─ \[\e[0;31m\]\W\\[\e[0;34m\]\n\[\e[0;34m\]└──── \[\e[00;00m\]"

export LS_OPTIONS='--color=auto'
[[ $- != *i* ]] && retirn

#ALIAS:
alias ls='ls --color=auto'
alias terminal='xrdb ~/.Xdefaults'
alias t=tmux

#RUBY:
#if which ruby >/dev/null && which gem >/dev/null; then
#    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi
