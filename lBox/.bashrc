# .bashrc Linux (M0th)
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Npack (.zip, .tar) unpacker
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

# CTERM
if [ "$TERM" = "linux" ]; then
     echo -en "\e]P00a0f0d" #black
     echo -en "\e]P8567366" #darkgrey
     echo -en "\e]P1134f4b" #darkred
     echo -en "\e]P9134f4b" #red
     echo -en "\e]P2fcfefe" #darkgreen
     echo -en "\e]PAfcfefe" #green
     echo -en "\e]P37ea298" #brown
     echo -en "\e]PB7ea298" #yellow
     echo -en "\e]P41E7D77" #darkblue
     echo -en "\e]PC626E68" #blue
     echo -en "\e]P5134f4b" #darkmagenta
     echo -en "\e]PD1D7872" #magenta
     echo -en "\e]P61db5a2" #darkcyan
     echo -en "\e]PE1db5a2" #cyan
     echo -en "\e]P7d0d1d2" #lightgrey
     echo -en "\e]PFd0d1d2" #white
     clear #for background artifacting
fi

# Ruby
#if which ruby >/dev/null && which gem >/dev/null; then
#    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

# Powerline BASH
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
# Arch
#. /usr/lib64/python3.6/site-packages/powerline/bindings/bash/powerline.sh
# Kali
#. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh

export VISUAL="vim"
alias ls='ls --color=auto'
alias dir="dir --color=auto"
alias grep="grep --colour=auto"

#PS1='[\u@\h \W]\$ '
#PS1="==> \[\033[38;5;1m\]WARNING:\[$(tput sgr0)\] "
#PS1="[\[\033[38;5;12m\]*\[$(tput sgr0)\]] "

#ROOT
#export PS1="+\[\033[38;5;134m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] >> \[$(tput sgr0)\]"
#USER
#export PS1="\[\033[38;5;134m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] >> \[$(tput sgr0)\]"

# ~/.bashrc COLORS PS1 and PS2
# If you need to change the color scheme, you need to comment out (PS1 and PS2)
#hicolor="\[\033[1m\]"
#fgblue="\[\033[34m\]"
#fgyellow="\[\033[33m\]"
#reset="\[\033[0m\]"
#fgred="\[\033[31m\]"
#fgmagenta="\[\033[35m\]"
#fgrred="\[\e[01;31m\]"
#fggreen="\[\033[01;32m\]"

#ROOT
#PS1="$hicolor$fgblue┌─ $hicolor$fgyellow*\u \A $reset\w $fggreen:) yes\n$hicolor$fgblue└─ $reset"
#PS2="$fgred> $reset$hicolor$fgmagenta"
#USER
#PS1="$hicolor$fgblue┌─ $hicolor$fgyellow*\u \A $reset\w $fgrred;( root\n$hicolor$fgblue└─ $reset"
#PS2="$fgred> $reset$hicolor$fgmagenta"
