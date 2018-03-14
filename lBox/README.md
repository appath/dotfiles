BSPWM DESKTOP
====
Installing

     pacman -S xorg xorg-xinit puthon3.6 vim python-pip curl git wget sxhkd bspwm tmux htop
     yaourt -S rxvt-unicode-patched

Powerline BASH, VIM

     $ su
     $ pip install powerline-status
     $ powerline-daemon -q
     $ POWERLINE_BASH_CONTINUATION=1
     $ POWERLINE_BASH_SELECT=1
     $ . /usr/lib64/python3.6/site-packages/powerline/bindings/bash/powerline.sh | Key "TAB "Return
