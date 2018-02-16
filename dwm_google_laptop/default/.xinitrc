#!/bin/bash
#~/.xprofile &
#~/.fehbg &
#compton -c user/.compton.conf &
xsetroot -cursor_name left_ptr
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xdefaults
#dwmstatus &
# Suond greeting bus...
#ogg123 -q /home/user/bus/sound.ogg &
exec dwm
