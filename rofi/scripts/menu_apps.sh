#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
files="ﱮ"
editor=""
music=""
audio=""

# Variable passed to rofi
options="$files\n$editor\n$music\n$audio"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $files)
        termite -e "/home/victor/.config/vifm/scripts/vifmrun" &
        ;;
    $editor)
        termite -e vim &
        ;;
    $music)
       i3-msg 'workspace number 10'; killall mpd; termite -e "ncmpcp"; mpd; termite -e "ncmpcpp"&
        ;;
    $audio)
        pavucontrol &
        ;;
esac

