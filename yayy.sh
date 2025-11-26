#!/usr/bin/env bash
repo=$(yay -Slq --repo)
aur=$(curl -s "https://aur.archlinux.org/packages.gz" | gunzip | tail -n +2 | cut -f1)

selection=$(echo -e "$repo\n$aur" | sort -u  | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% --layout=reverse)
[[ -z "$selection" ]] && exit

xargs -r yay -S --noconfirm <<<"$selection"

