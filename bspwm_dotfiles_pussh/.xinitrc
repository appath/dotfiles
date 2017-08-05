#!/bin/bash
xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xdefaults
exec bspwm
