<a href="https://area31.net.br" title="area31.net.br"> ... area31</a>

GRAY BSPWM DESKTOP
====
Installing

     Arch
     pacman -S xorg xorg-xinit python3.6 vim python-pip curl git wget sxhkd bspwm tmux htop dfc mupdf firefox
     yaourt -S rxvt-unicode-patched lfm
     
     Kali
     apt install xorg python3.6 python-pip curl git wget sxhkd bspwm tmux vim-nox htop dfc mupdf rxvt-unicode lfm firefox
[Kali Linux](https://www.kali.org/) Minimal [+ISO](https://docs.kali.org/installation/kali-linux-network-mini-iso-install)

Kali Grub, Font Video Driver VirtualBox
      
      nano -w /etc/default/grub 
      nano -w /etc/grub.d/05_debian_theme
          black/black
          black/light-gray
          
      update-grub -o grub.cfg
      grub-mconfig -o /boot/grub/grub.cfg
      dpkg-reconfigure console-setup
      apt update && apt install -y linux-headers-$(uname -r)
      mount /dev/sr0 /media/cdrom
      cp /media/cdrom/VBoxLinuxAdditions.run ~/
      chmod 755 VBoxLinuxAdditions.run
      ./VBoxLinuxAdditions.run
      reboot

Easy Powerline BASH, VIM

     $ su
     $ pip install powerline-status
     $ powerline-daemon -q
     $ POWERLINE_BASH_CONTINUATION=1
     $ POWERLINE_BASH_SELECT=1
     $ . /usr/lib64/python3.6/site-packages/powerline/bindings/bash/powerline.sh | Key "TAB "Return
 
Screensots [*1](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/scrot/screenshot_1.jpg), [*2](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/scrot/screenshot_2.jpg)
 
![lBox](scrot/screenshot_1.png)
 
[SHH_KEY](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/SHH_KEY)
 
[MetaSploit](https://github.com/rapid7/metasploit-framework)
 
++ SCRIPT service [+.metaservice](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/.metaservice

.[git: powerline/powerline] 'https://github.com/powerline/powerline'

.[video: install] 'https://www.youtube.com/watch?v=WVGDJat3rd8&feature=youtu.be'
