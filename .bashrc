#
# ~/.bashrc
#

function about() {
cat <<EOF

EOF
}

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

# Re:colors
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

# Sanitize TERM Console
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -f ~/.dirColors ]] && match_lhs="${match_lhs}$(</etc/.dirColors)"
[[ -z ${match_lhs} ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then

	# Enable colors for ls, etc. Prefer ~/.dir_colors
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]\[\033[01;34m\]\")\\$\[\033[00m\] "
	
	alias ls="ls --color=auto"
	alias dir="dir --color=auto"
	alias grep="grep --colour=auto"

else

	# Other customized bashrc
	PS1='\[\033[1;30m\][\[\033[0;37m\]${PIPESTATUS}\[\033[1;30m\]:\[\033[0;37m\]${SHLVL}\[\033[1;30m\]:\[\033[0;37m\]\j\[\033[1;30m\]][\[\033[1;34m\]\u\[\033[0;34m\]@\[\033[1;34m\]\h\[\033[1;30m\]:\[\033[0;37m\]`tty | sed s/\\\\\/dev\\\\\/\//g`\[\033[1;30m\]]\[\033[0;37m\][\[\033[1;37m\]\W\[\033[0;37m\]]\[\033[1;30m\] \$\[\033[00m\] '

fi

PS2="> "
PS3="> "
PS4="+ "

# PATH
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

