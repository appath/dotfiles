#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# napck
npack () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *.xz)        unxz $1        ;;
      *.exe)       cabextract $1  ;;
      *)           echo "\`$1': Unknown method of file compression" ;;
    esac
  else
    echo "\`$1' no foud"
  fi
}

# Ruby
#if which ruby >/dev/null && which gem >/dev/null; then
#    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

# Powerline BASH
# Arch
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib64/python3.6/site-packages/powerline/bindings/bash/powerline.sh
# Kali
#. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh

export VISUAL="vim"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
#PS1="[\[\033[38;5;12m\]*\[$(tput sgr0)\]] "
