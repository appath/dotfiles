#!/bin/sh
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xdefaults
xsetroot -cursor_name left_ptr
compton --config $HOME/bin/compton.mono.conf -C &

# Window X11 Manager BSPWN [WM]...
exec bspwm
