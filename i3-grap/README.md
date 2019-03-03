#### Installing i3-grap

Install from the official repository, i3-wm directly window manager.

git clone https://github.com/appath/dotfiles.git

PKG pacman -S
```bash
xorg xorg-xinit i3-gaps i3blocks rxvt-unicode tree git tmux vim mc fontconfig
```

install font

git clone https://github.com/whitelynx/artwiz-fonts-wl

```bash
# cd ./MAKEFILES/artwiz-fonts-wl
```

Building Fonts
```bash
# make
```
Installing Fonts
```bash
# make install
```
On Arch Linux, this file is named /etc/fonts/conf.d/70-no-bitmaps.conf, and the file /etc/fonts/conf.avail/70-yes-bitmaps.conf should be linked in its place:
```bash
# rm /etc/fonts/conf.d/70-no-bitmaps.conf
# ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/
```
