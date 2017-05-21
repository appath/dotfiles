# ZSH
# XTerm 256color
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color
#[[ $TMUX = "" ]] && export TERM="xterm-256color"
# You can enter comments beginning with #.
setopt interactive_comments
# Add the execution time of the command to the history.
setopt extended_history
# Updates the history after each press of enter.
setopt inc_append_history
# History becomes common between all sessions and terminals.
setopt share_history
# Pingue five time instead of infinity
alias ping='ping -c5'
# From an excess of intelligence.
unsetopt correct_all
# Autocomplete with the help of arrows.
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# Prompt
PS1='%(?.%F{251}.%F{009})*%f '
RPS1='[%B%F{251}%~%f%b][%B%F{214}%T%f%b]'
# Default Text Editor
export EDITOR=/usr/bin/ee
# Command history files, file size and number of entries.
export HISTSIZE=5500
export SAVEHIST=5500
export HISTFILE=~/.zshrc_history
# UTF-8 character tmux.
alias tmux='tmux -u'
