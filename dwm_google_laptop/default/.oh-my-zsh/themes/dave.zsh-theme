### This topic is a clone..
### It is possible and without a font Powerline / PragmataPro
### Date and Time
if [ "$DAVE_RPROMPT_TIME" = "" ]; then
  DAVE_RPROMPT_TIME=%D{%H:%M}
fi
if [ "$DAVE_RPROMPT_DATE" = "" ]; then
  DAVE_RPROMPT_DATE=%D{%Y-%m-%d}
fi

### Path
function dave_dir_prompt_info {
	DAVE_PWD=`pwd`
	if [[ ~ == "${DAVE_PWD}" ]]; then
		DAVE_DIRNAME="~"
	else
		DAVE_DIRNAME=$(basename "${DAVE_PWD}")
	fi
	echo $DAVE_DIRNAME;
}
DAVE_DIR_INFO='$(dave_dir_prompt_info)'

### Git Prompt
DAVE_GIT_INFO_LEFT='$(git_prompt_info)'

### Subversion Prompt
function dave_svn_prompt_info {

	wd=`pwd -P`

	SVN_WORKING_COPY_ROOT_PATH_STRING=$( svn info 2> /dev/null | grep '^Working Copy Root Path*' 2> /dev/null ) || return
	SVN_RELATIVE_DIR=$( echo $SVN_WORKING_COPY_ROOT_PATH_STRING | cut -d' ' -f 5 2> /dev/null) || return
	SVN_RELATIVE_DIR_ESCAPED=$(echo $SVN_RELATIVE_DIR | sed 's/\//\\\//g')
	SVN_REPO_PATH="$( echo $wd | sed "s/${SVN_RELATIVE_DIR_ESCAPED}//g") "

	SVN_REVISION_STRING=$(svn info 2> /dev/null | grep '^Revision*') || return
	SVN_REVISION=$(echo $SVN_REVISION_STRING | cut -d' ' -f 2 ) || return
	
	### this is the slowest test of the bunch
	change_count=`svn status | grep "^?\|\!\|M\|A" | wc -l | awk '{print $1}'`
	if [ "${change_count}" != '0' ]; then
		svn_change="$ZSH_THEME_SVN_PROMPT_DIRTY"
	else
		svn_change="$ZSH_THEME_SVN_PROMPT_CLEAN"
	fi

	### Set the Prompt String	
	echo "$ZSH_THEME_SVN_PROMPT_PREFIX$SVN_REPO_PATH[2,-1]"'r'"$SVN_REVISION%{${svn_change}%}$ZSH_THEME_SVN_PROMPT_SUFFIX"
}

### This puts the literal string $(dave_svn_prompt_info) right into the prompt, meaning it will run at every prompt
DAVE_SVN_INFO_LEFT='$(dave_svn_prompt_info)'

### Date / Time / Display Defaults
if [ -z $DAVE_SHOW_DATE ]; then
	DAVE_SHOW_DATE='YES'
fi
if [ -z $DAVE_SHOW_TIME ]; then
	DAVE_SHOW_TIME='YES'
fi

### Color Defaults
if [ -z $DAVE_COLOR_HOST_BG ]; then
	DAVE_COLOR_HOST_BG='012'
fi
if [ -z $DAVE_COLOR_HOST_FG ]; then
	DAVE_COLOR_HOST_FG='252'
fi
if [ -z $DAVE_COLOR_USER_BG ]; then
	DAVE_COLOR_USER_BG='004'
fi
if [ -z $DAVE_COLOR_USER_FG ]; then
	DAVE_COLOR_USER_FG='252'
fi
if [ -z $DAVE_COLOR_DIR_BG ]; then
	DAVE_COLOR_DIR_BG='022'
fi
if [ -z $DAVE_COLOR_DIR_FG ]; then
	DAVE_COLOR_DIR_FG='252'
fi
if [ -z $DAVE_COLOR_GIT_BG ]; then
	DAVE_COLOR_GIT_BG='054'
fi
if [ -z $DAVE_COLOR_GIT_FG ]; then
	DAVE_COLOR_GIT_FG='252'
fi
if [ -z $DAVE_COLOR_END_BG ]; then
	DAVE_COLOR_END_BG='255'
fi
if [ -z $DAVE_COLOR_GIT_CLEAN ]; then
	DAVE_COLOR_GIT_CLEAN='118'
fi
if [ -z $DAVE_COLOR_GIT_DIRTY ]; then
	DAVE_COLOR_GIT_DIRTY='133'
fi
if [ -z $DAVE_COLOR_DATE_FG ]; then
	DAVE_COLOR_DATE_FG='255'
fi
if [ -z $DAVE_COLOR_DATE_BG ]; then
	DAVE_COLOR_DATE_BG='240'
fi
if [ -z $DAVE_COLOR_TIME_FG ]; then
	DAVE_COLOR_TIME_FG='240'
fi
if [ -z $DAVE_COLOR_TIME_BG ]; then
	DAVE_COLOR_TIME_BG='255'
fi

### Color Setup
DAVE_HOST_BG=%K{$DAVE_COLOR_HOST_BG}
DAVE_HOST_FG=%F{$DAVE_COLOR_HOST_FG}
DAVE_HOSTUSER_BG=%K{$DAVE_COLOR_USER_BG}
DAVE_HOSTUSER_FG=%F{$DAVE_COLOR_HOST_BG}
DAVE_USER_BG=%K{$DAVE_COLOR_USER_BG}
DAVE_USER_FG=%F{$DAVE_COLOR_USER_FG}
DAVE_USERDIR_BG=%K{$DAVE_COLOR_DIR_BG}
DAVE_USERDIR_FG=%F{$DAVE_COLOR_USER_BG}
DAVE_DIR_BG=%K{$DAVE_COLOR_DIR_BG}
DAVE_DIR_FG=%F{$DAVE_COLOR_DIR_FG}
DAVE_DIRGIT_BG=%K{$DAVE_COLOR_GIT_BG}
DAVE_DIRGIT_FG=%F{$DAVE_COLOR_DIR_BG}
DAVE_GIT_BG=%K{$DAVE_COLOR_GIT_BG}
DAVE_GIT_FG=%F{$DAVE_COLOR_GIT_FG}
DAVE_GITEND_BG=%K{$DAVE_COLOR_END_BG}
DAVE_GITEND_FG=%F{$DAVE_COLOR_GIT_BG}
DAVE_END_BG=%K{$DAVE_COLOR_END_BG}
DAVE_END_FG=%F{$DAVE_COLOR_DIR_BG}
GIT_CLEAN_COLOR=%F{$DAVE_COLOR_GIT_CLEAN}
GIT_DIRTY_COLOR=%F{$DAVE_COLOR_GIT_DIRTY}
DAVE_DATE_FG=%F{$DAVE_COLOR_DATE_FG}
DAVE_DATE_BG=%K{$DAVE_COLOR_DATE_BG}
DAVE_TIME_FG=%F{$DAVE_COLOR_TIME_FG}
DAVE_TIME_BG=%K{$DAVE_COLOR_TIME_BG}
DAVE_TIMEDATE_FG=%F{$DAVE_COLOR_DATE_BG}
DAVE_TIMEDATE_BG=%K{$DAVE_COLOR_TIME_BG}
DAVE_TIMEEND_FG=%F{$DAVE_COLOR_TIME_BG}
DAVE_TIMEEND_BG=%K{$DAVE_COLOR_END_BG}
DAVE_DATEEND_FG=%F{$DAVE_COLOR_DATE_BG}
DAVE_DATEEND_BG=%K{$DAVE_COLOR_END_BG}


### Git Prompt Setup
### The (dollar)'\u0008' below is a backspace character.
### It backs up one char over the END connector, and then we overwrite it with the GIt connector instead.
ZSH_THEME_GIT_PROMPT_PREFIX=$'\u0008'"%{${DAVE_DIRGIT_BG}%}%{${DAVE_DIRGIT_FG}%}"$'\u25B6'"%{${DAVE_GIT_BG}%}%{${DAVE_GIT_FG}%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{${DAVE_GITEND_BG}%}%{${DAVE_GITEND_FG}%}"$'\u25B6'
ZSH_THEME_GIT_PROMPT_DIRTY="%{ %{${GIT_DIRTY_COLOR}%}"$'\u2717'"%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{ %{${GIT_CLEAN_COLOR}%}"$'\u2714'"%}"
#ZSH_THEME_GIT_PROMPT_ADDED="%F{082}✚%f"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%F{166}✹%f"
#ZSH_THEME_GIT_PROMPT_DELETED="%F{160}✖%f"
#ZSH_THEME_GIT_PROMPT_RENAMED="%F{220]➜%f"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%F{082]═%f"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{190]✭%f"

### Subversion Prompt Setup
### The (dollar)'\u0008' below is a backspace character.
### It backs up one char over the END connector, and then we overwrite it with the GIt connector instead.
ZSH_THEME_SVN_PROMPT_PREFIX=$'\u0008'"%{${DAVE_DIRGIT_BG}%}%{${DAVE_DIRGIT_FG}%}"$'\u25B6'"%{${DAVE_GIT_BG}%}%{${DAVE_GIT_FG}%} "
ZSH_THEME_SVN_PROMPT_SUFFIX=" %{${DAVE_GITEND_BG}%}%{${DAVE_GITEND_FG}%}"$'\u25B6'
ZSH_THEME_SVN_PROMPT_DIRTY=" %{${GIT_DIRTY_COLOR}%}"$'\u2717'
ZSH_THEME_SVN_PROMPT_CLEAN=" %{${GIT_CLEAN_COLOR}%}"$'\u2714'

### Left Prompt
PROMPT="%{${DAVE_HOST_BG}%}%{${DAVE_HOST_FG}%}"
PROMPT="${PROMPT} ${(C)$(hostname -s)} "
PROMPT="${PROMPT}%{${DAVE_HOSTUSER_BG}%}%{${DAVE_HOSTUSER_FG}%}"
PROMPT="${PROMPT}"$'\u25B6'
PROMPT="${PROMPT}%{${DAVE_USER_BG}%}%{${DAVE_USER_FG}%}"
PROMPT="${PROMPT} %n "
PROMPT="${PROMPT}%{${DAVE_USERDIR_BG}%}%{${DAVE_USERDIR_FG}%}"
PROMPT="${PROMPT}"$'\u25B6'
PROMPT="${PROMPT}%{${DAVE_DIR_BG}%}%{${DAVE_DIR_FG}%}"
PROMPT="${PROMPT} ${DAVE_DIR_INFO} "
PROMPT="${PROMPT}%{${DAVE_END_BG}%}%{${DAVE_END_FG}%}"
PROMPT="${PROMPT}"$'\u25B6'
PROMPT="${PROMPT}${DAVE_GIT_INFO_LEFT}${DAVE_SVN_INFO_LEFT}"
PROMPT="${PROMPT} %f%k"
if [ "$DAVE_NO_BLANK_LINE" = "" ]; then
    PROMPT="
${PROMPT}"
fi

### Right Prompt \u25C0
if [ $DAVE_SHOW_DATE = 'YES' ] || [ $DAVE_SHOW_TIME = 'YES' ]; then
	RPROMPT=''
	if [ $DAVE_SHOW_TIME = 'YES' ]; then
		RPROMPT="${RPROMPT}%{${DAVE_TIMEEND_BG}%}%{${DAVE_TIMEEND_FG}%}"
		RPROMPT="${RPROMPT}"$'---'
                RPROMPT="${RPROMPT}%{${DAVE_TIME_BG}%}%{${DAVE_TIME_FG}%}"
                RPROMPT="${RPROMPT} ${DAVE_RPROMPT_TIME} "
	fi
	if [ $DAVE_SHOW_DATE = 'YES' ]; then
		if [ $DAVE_SHOW_TIME = 'YES' ]; then
			RPROMPT="${RPROMPT}%{${DAVE_TIMEDATE_BG}%}%{${DAVE_TIMEDATE_FG}%}"
                	RPROMPT="${RPROMPT}"
		else
			RPROMPT="${RPROMPT}%{${DAVE_DATEEND_BG}%}%{${DAVE_DATEEND_FG}%}"
	                RPROMPT="${RPROMPT}"
		fi
		RPROMPT="${RPROMPT}%{${DAVE_DATE_BG}%}%{${DAVE_DATE_FG}%}"
		RPROMPT="${RPROMPT} ${DAVE_RPROMPT_DATE} "
                RPROMPT="${RPROMPT}%f%k"
	fi
else
	RPROMPT=''
fi
