<a href="https://area31.net.br" title="area31.net.br"> ... area31</a>

GRAY BSPWM DESKTOP
====
Installing

     Arch
     pacman -S xorg xorg-xinit python3.6 vim python-pip curl git wget sxhkd bspwm tmux htop dfc mupdf firefox
     yaourt -S rxvt-unicode-patched lfm
     
     Kali
     apt install xorg python3.6 python-pip curl git wget sxhkd bspwm tmux vim-nox htop dfc mupdf rxvt-unicode lfm firefox
     nmap
     

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
 
Screenshots [*1](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/scrot/screenshot_1.jpg), [*2](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/scrot/screenshot_2.jpg)
 
![lBox](scrot/screenshot_1.jpg)
 
[SHH_KEY](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/SHH_KEY)
 
[MetaSploit](https://github.com/rapid7/metasploit-framework)

Запуск Metasploit Framewor >> Launch the Metasploit Framework

     Database
     /etc/init.d/postgresql start
     работает или нет ? postgresql и убедившись, что порт 5432 прослушивается
     works or not? postgresql and making sure that port 5432 is listening
     ss -ant
     netstat -anp | grep 5432
     Инициализируем базу данных Metasploit
     Initializing the Metasploit database
     msfdb init
     Запускаем мсфконсо́ль
     We launch
     msfconsole
     
     Если вы предпочитаете иметь запущенные PostgreSQL
     If you prefer to have running PostgreSQL
     update-rc.d postgresql enable
     
++ SCRIPT service [+.metaservice](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/.metaservice)

Cobra_2 [+ansi](https://raw.githubusercontent.com/appath/dotfiles/master/lBox/cobra_2.ansi.txt)

![Cobra_2](scrot/cobra_2.jpg)

.[git: powerline/powerline] 'https://github.com/powerline/powerline'

.[video: install] 'https://www.youtube.com/watch?v=WVGDJat3rd8&feature=youtu.be'
