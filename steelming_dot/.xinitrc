#!/bin/sh
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr
## Window X11 Manager BSPWM [WM]...
exec bspwm
