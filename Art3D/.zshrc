# Path to your zsh installation
export EDITOR=nano
export VISUAL=nano
export BROWSER=luakit
export LC_ALL=en_US.utf8
export CDPATH=/home/user/.RoR/

# Workaround for handling Term variable in multiple (tmux) sessions
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
	case $(tmux showenv TERM 2>/dev/null) in
		*256color) ;&
		TERM=fbter)
			TERM=screen-256color ;;
		*)
			TERM=screen
	esac
fi

# Ignore space
set HIST_IGNORE_SPACE
#  Do not squeak when adding or making mistakes
setopt NO_BEEP
# If you typed the path to the directory without the cd command, then go
setopt AUTO_CD
# The number of commands stored in the HISTFILE
SAVEHIST=2300
# Command history file
HISTFILE=~/.zsh_history

# Configuration
alias ls='ls --color=auto'
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT="[*] %~ "
