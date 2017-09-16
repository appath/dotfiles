#!/bin/sh
~/.fehbg &
compton &
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xdefaults
dwmstatus &
exec dwm
