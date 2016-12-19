#!/bin/sh

export LANG=en_US.UTF-8

xsetroot -cursor_name left_ptr&

feh --bg-scale /home/vatrat/wallpaper.png

/usr/bin/setxkbmap -option "caps:escape"

# trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --height 17 --transparent true --alpha 0 --tint 0x242424 &

rofi &

# xscreensaver -no-splash &

#compton -b


# Section "InputClass"
#     Identifier "Keyboard Defaults"
#     MatchIsKeyboard "yes"
#     Option  "XkbLayout" "us"
#     Option  "XkbVariant" "altgr-intl"
# EndSection

# xmodmap -e "keycode 133 = ISO_Level3_Shift"
# xmodmap -e "keycode 108 = Alt_L"
