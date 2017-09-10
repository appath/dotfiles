compton -c -t-5 -l-5 -r3 -C &
ogg123 -g $HOME/Music/alarm_on_he_wheelbarrow.mp3 &
eval 'dbus-launch'
export DBUS_SESSION_BUS_ADDRESS
xrdb -merge ~/.Xresources
xset +fp $HOME/.fonts
xset fp rehash
~/.profile &
~/.fehbg &
ssat $BOTS 'BUS_BB'
.BOTS &
=========
exec dwm
