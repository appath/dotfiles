# ~/.bashrc

# ConsO
PS1='[++] '
#PS1="\n\e[1;37m\]\A\\n\[\e[0;34m\]┌─ \[\e[0;31m\]\W\\[\e[0;34m\]\n\[\e[0;34m\]└──── \[\e[00;00m\]"

[[ $- != *i* ]] && retirn

# Alias
alias ls='ls --color=auto'
alias terminal='xrdb ~/.Xdefaults'
alias t=tmux

# Ruby
#if which ruby >/dev/null && which gem >/dev/null; then
#    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

# Unpacking of all types of archives (tar, tar.gz, tar.xz, tar.bz2, bz2, zip, Z, 7z, xz, rar, gz, tar, tbz2, tgz and exe).
# npack archive.tar.gz
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

# Export
export VISUAL="vim"
