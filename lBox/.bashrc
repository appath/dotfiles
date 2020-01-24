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

# Ruby
#if which ruby >/dev/null && which gem >/dev/null; then
#    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

export VISUAL="vim"
alias ls='ls --color=auto'
alias dir="dir --color=auto"
alias grep="grep --colour=auto"

PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( $(sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo)/1024))"\033[38;5;22m/"$(($(sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo)/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"'
PS1="# "
