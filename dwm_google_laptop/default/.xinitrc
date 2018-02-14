#!/bin/bash
#~/.fehbg &
~/.xprofiles &
#compton &
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xdefaults
#dwmstatus &
# Suond greeting bus...
#ogg123 -q /home/user/bus/sound.ogg &
exec dwm
