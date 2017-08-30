## Prompt Expansion
## The return %? status of the last command executed just before.
## Current %t time in 12-hour, [am,pm] format. 
## The line number %i currently being executed in the script
PROMPT="%{$fg[white]%}#! "
RPROMPT="%{$fg_no_bold[magenta]%}%t%{$reset_color%} %{$fg_no_bold[red]%}%?%{$reset_color%}*%{$fg_no_bold[blue]%}%i%{$reset_color%}"
