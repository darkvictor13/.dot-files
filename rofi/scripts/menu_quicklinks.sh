#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/menu/quicklinks.rasi"

# Links
arch=""
whatsapp="甆"
biblia=""
uri=""
github=""
youtube=""

# Variable passed to rofi
options="$arch\n$whatsapp\n$biblia\n$uri\n$github\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In : Brave" -dmenu -selected-row 0)"
case $chosen in
    $arch)
        brave --new-tab https://wiki.archlinux.org
        ;;
    $whatsapp)
        brave --new-tab https://web.whatsapp.com
        ;;
    $biblia)
        brave --new-tab https://www.bibliaonline.com.br/acf
        ;;
    $uri)
        brave --new-tab https://www.urionlinejudge.com.br/judge/pt/problems/index/1?page=8
        ;;
    $github)
        brave --new-tab https://www.github.com
        ;;
    $youtube)
        brave --new-tab https://www.youtube.com
        ;;
esac
