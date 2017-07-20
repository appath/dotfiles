#### Installing

Install from the official repository, i3-wm directly window manager.

To change the configuration of i3, copy:
```shell
cp /etc/i3/config to ~/.config/i3/.config
```

As an alternative I use `startx`, this can be done in your ~/.xinitrc
```shell
exec i3 -V >> ~/.i3/i3log 2>&1
```

#### Packages:
- tmux
- rxvt-unicode
- feh
- rofi
- luakit-git
- compton
- mc 
- i3wm 
- i3status
- vim

#### Fonts:
FiraMono and gmnterm

#### Key: 
Mod1+F5 > Rofi

Mod1+F6 > Luakit

Mod1+Return > Rxvt

I do not know whether it's worth it or not. But how to install the fonts is so
```shell
$ mkdir ~/.fonts
$ cp .... ~/.fonts
$ cd ~/.fonts
$ mkfontscale
$ mkfontdir
$ fc-cache -fv
```
![i3](https://github.com/appath/dotfiles/blob/master/i3wm_dotfiles_laptop/i3wm_laptop.png)

#### Social

* [DeviantArt](http://boris241.deviantart.com/) Here I post different topics.
* [Google+](https://plus.google.com/u/0/106782122945207734872) //
