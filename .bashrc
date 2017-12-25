## About Section
function about() {
cat <<EOF
####################################
# DracOS Bashrc                    #
# Inspired by ultimate bashrc      #
# By: randalltux || @randalltux    #
#                                  #
# license:                         #
# This program is free software;   #
# You can redistribute it and/or   #
# modify it under the terms of the #
# GNU General Public License       #
#                                  #
# 2016 - rndtx | DracOS Dev Team   #
# ================================ #
# Credits:                         #
# 	- RANDALLTUX               #
#	- ZEE EICHEL		   #
#	- CYBERKING		   #
####################################
EOF
}

# We have new colors!! YEAY!
# Colors
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# tty-colorizer
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

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
	screen)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
esac

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -f ~/DracOS.dirColors ]] && match_lhs="${match_lhs}$(</etc/DracOS.dirColors)"
[[ -z ${match_lhs} ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then
	
	# we have colors :-)

	# Enable colors for ls, etc. Prefer ~/.dir_colors
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]\[\033[01;34m\]\")\\$\[\033[00m\] "

	# Use this other PS1 string if you want \W for root and \w for all other users:
	# PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\033[01;34m\] \W'; else echo '\[\033[01;32m\]\u@\h\[\033[01;34m\] \w'; fi) \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

	alias ls="ls --color=auto"
	alias dir="dir --color=auto"
	alias grep="grep --colour=auto"

else

	# show root@ when we do not have colors
	# PS1="\u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$ "

	# Use this other PS1 string if you want \W for root and \w for all other users:
	# PS1="\u@\h $(if [[ ${EUID} == 0 ]]; then echo '\W'; else echo '\w'; fi) \$([[ \$? != 0 ]] && echo \":( \")\$ "
	
	# Simple Bashrc
	# PS1="
	# \@ $FBLE \W $RS "
	
	# Other customized bashrc prompt try one by one :p
	# PS1='\[\033]0;\w\007\]\[\e[35;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[34m\]\w \[\e[33m\]\$ \[\e[0m\]'
	# PS1='\[\033[01;31m\]\u\[\033[01;36m\]@\[\033[01;32m\]\h\[\033[01;33m\]:\[\033[01;33m\]\w\n\[\033[01;31m\]\$ \[\033[00;32m\]'
	# PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
	# PS1="\[\033[0;31m\][\u] [ \w ] \[\033[0m\] \n # "
	# PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"
	# PS1="\[\033[0;34m\][\u] \[\033[0;0m\]\w \[\033[0m\]$ "
	# PS1="\[\033[0;34m\][\u] \[\033[0;31m\][ \w ] \[\033[0m\] \n >> "
	# PS1="\[\033[0;34m\][\u] \[\033[0;33m\][ \t ] \[\033[0;31m\][ \w ] \[\033[0m\] \n >> "
	PS1='\[\033[1;30m\][\[\033[0;37m\]${PIPESTATUS}\[\033[1;30m\]:\[\033[0;37m\]${SHLVL}\[\033[1;30m\]:\[\033[0;37m\]\j\[\033[1;30m\]][\[\033[1;34m\]\u\[\033[0;34m\]@\[\033[1;34m\]\h\[\033[1;30m\]:\[\033[0;37m\]`tty | sed s/\\\\\/dev\\\\\/\//g`\[\033[1;30m\]]\[\033[0;37m\][\[\033[1;37m\]\W\[\033[0;37m\]]\[\033[1;30m\] \$\[\033[00m\] '
	# PS1="[\[\033[1;34m\]\u\[\033[0m\]@\h \W]\\$ "
	# PS1="[\!] \033[1;36m[ \u@\h ]\033[1;32m\] [ \t ] [ \d ]\n\033[1;33m\[[ \w ] \033[00m\\n\[\e[30;1m\](\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\]) \[\e[0m\] $: "
	# PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
	# PS1='\e[1;31;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;31m[dir.= \w] \# > \e[0;0m'
	# PS1="\[\e[37;1m\]-{\[\e[34;1m\]\u@\h\[\e[37;1m\]}-\n\[\e[37;1m\](\[\e[34;1m\]\w: \$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[37;1m\])\n--> \[\e[0m\]"
	# PS1="\n\[\033[32;1m\]It's \t\[\033[33;1m\] Currently browsing \[\033[1;36m\]\w \[\033[33;1m\]directory\n\[\033[34;1m\]\`if [ \$? = 0 ]; then echo \[\e[37m\]Last Command Was Successfully Executed \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[37m\]Smeggin Hell !!! Last Command Was Unknown \[\e[32m\]O_O\[\e[0m\]; fi\` \n\[\033[31m\]DracOS GNU/Linux Shell \n\n\[\033[34;1m\]"
	# PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '
fi

PS2="> "
PS3="> "
PS4="+ "

# PATH
# ~/bin
if [ -d "$HOME/bin" ];
    then PATH="$HOME/bin:$PATH"
fi

# /usr/local/bin
if [ -d "/usr/local/bin" ];
    then PATH="/usr/local/bin:$PATH"
fi

# /usr/local/sbin
if [ -d "/usr/local/sbin" ];
    then PATH="/usr/local/sbin:$PATH"
fi

# /usr/bin
if [ -d "/usr/bin" ];
    then PATH="/usr/bin:$PATH"
fi

# /usr/sbin
if [ -d "/usr/sbin" ];
    then PATH="/usr/sbin:$PATH"
fi

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

