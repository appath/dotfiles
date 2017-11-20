#!/bin/sh
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr
sxhkd &
exec bspwm
#exec openbox-session
