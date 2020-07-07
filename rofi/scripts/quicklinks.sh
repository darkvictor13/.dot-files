#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/quicklinks.rasi"

# Links
arch=""
facebook=""
twitter=""
github=""
reddit=""
youtube=""

# Variable passed to rofi
options="$arch\n$facebook\n$twitter\n$github\n$reddit\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  Brave" -dmenu -selected-row 0)"
case $chosen in
    $arch)
        brave --new-tab https://wiki.archlinux.org/
        ;;
    $facebook)
        firefox --new-tab https://www.facebook.com
        ;;
    $twitter)
        firefox --new-tab https://www.twitter.com
        ;;
    $github)
        firefox --new-tab https://www.github.com
        ;;
    $reddit)
        firefox --new-tab https://www.reddit.com
        ;;
    $youtube)
        firefox --new-tab https://www.youtube.com
        ;;
esac
