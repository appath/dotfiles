#!/bin/sh
xsetroot -cursor_name left_ptr
xrdb -merge .Xdefaults
xset +fp $HOME/.fonts
xset fp rehash
exec bspwm
