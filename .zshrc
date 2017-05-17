# Editor
export EDITOR="vim"
# You can enter comments beginning with #.
setopt interactive_comments
# History
HISTFILE=$HOME/.zshrc_history
HISTSIZE=2000
SAVEHIST=2000
# Add the execution time of the command to the history.
setopt extended_history
# Updates the history after each press of enter.
setopt inc_append_history
# History becomes common between all sessions and terminals.
setopt share_history
# Pingue two time instead of infinity
alias ping='ping -c5'
# From an excess of intelligence.
unsetopt correct_all
