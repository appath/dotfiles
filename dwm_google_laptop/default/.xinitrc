#!/bin/sh
~/.fehbg &
compton -c -t-5 -l-5 -r3 -C &
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xdefaults
dwmstatus &
exec dwm
