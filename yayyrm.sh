#!/usr/bin/env bash
# usage: yayyrm [-d | -s]   -d: newest installed first, -s: largest first, default: by name
case "$1" in
    -d) list=$(pacman -Qqe | expac --timefmt='%F %T' '%n\t%l' - | sort -t$'\t' -k2,2r) ;;
    -s) list=$(pacman -Qqe | expac '%n\t%m' - | sort -t$'\t' -k2,2nr | numfmt -d $'\t' --field=2 --to=iec) ;;
    *)  list=$(pacman -Qqe) ;;
esac

selection=$(fzf --multi --tiebreak=index --preview 'pacman -Qi {1}' --preview-window=down:75% --layout=reverse --header="SELECT PACKAGES TO UNINSTALL" <<<"$list")
[[ -z "$selection" ]] && exit

cut -f1 <<<"$selection" | xargs -ro sudo pacman -Rns
