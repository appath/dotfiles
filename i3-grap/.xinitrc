xrdb -merge /root/.Xresources
xsetroot -cursor_name left_ptr
xset +fp /root/.fonts
xset fp rehash
sh ./.fehbg &
sleep 2

exec i3
