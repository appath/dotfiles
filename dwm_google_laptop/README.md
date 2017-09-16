UPDATE 16.09.2017

#### Custom DWM Google:.

Funny topic turned out.

In honor of the search engine made a topic for the medganger icon.

You will need to install Three packages with dependencies!

dwm, dmenu and dwmstatus

* xorg-xsetroot, freetype2, libx11, libxft, libxinerama.

So I attached the fonts in the folder default

#### dmenu Only you will need to fix to your screen resolution!

#### Installation
```git clone https://github.com/appath/dotfiles```

Let's now scan to the specified directory on your hard disk. Example

```cp -p github/dotfiles/dwm_google_laptop/dwm_custom /home/user/build/dwm```

```cp -p github/dotfiles/dwm_google_laptop/dmenu_custom /home/user/build/dmenu```

```cp -p github/dotfiles/dwm_google_laptop/dwmstatus_custom /home/user/build/dwmstatus```

Now let's move to the directory dwm

```cd build/dwm/```

We will collect and install ours with you dwm

```make && sudo make clean install```

and

```cd build/dmenu/```

```make && sudo make clean install```

Added by dwmstatus 17.08.2017

![dwmstatus](https://github.com/appath/dotfiles/blob/master/dwm_google_laptop/dwmstatus.jpg)

``` cd build/dwmstatus/```

```make && sudo make clean install```

We installed a window manager and search for applications with you.

You can use my files, I added them as well, you will find them in folders default~

#### How to install fonts

```cd .fonts/```

```mkfontscale```

```mkfontdir```

```fc-cache -fv```

All fonts installed!

Now just run the command

```startx```

You are in the window manager's environment.

Combinations of command keys are in the file description config.h

alt + enter = Start the terminal. Default I have a patch rxvt

alt + shift + c = Kill terminal or close

alt + shift + q = Kill the window manager

alt + shift + p = open dmenu.

#### Running on the working window

alt + [1-7]

Here are my default settings.

#### Used packages

tmux, zsh, compton, rxvt-unicode-patched, lolcat, feh...

#### Screenshot
![dwm_google](https://github.com/appath/dotfiles/blob/master/dwm_google_laptop/dwm_custom.png)

![new](https://github.com/appath/dotfiles/blob/master/dwm_google_laptop/20_35_35.png)

#### Video 

[Video](https://www.youtube.com/watch?v=Vz7E4lwTb_A) DWM:...

#### Uninstall

dwm:.

```cd build/dwm/```

```sudo make uninstall```

dmenu:.

```cd build/dmenu/```

```sudo make uninstall```

dwmstatus:.

```cd build/dwmstatus/```

```sudo make uninstall```

#### Social

* [DeviantArt](http://boris241.deviantart.com/) Here I post different topics.
* [Google+](https://plus.google.com/u/0/106782122945207734872) //
* [suckless dwm](http://suckless.org/) Original
