#!/usr/bin/env bash
repo=$(yay -Slq --repo)
aur=$(curl -fsSL "https://aur.archlinux.org/packages.gz" | gunzip)

selection=$(echo -e "$repo\n$aur" | sort -u  | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% --layout=reverse)
[[ -z "$selection" ]] && exit

xargs -ro yay -S <<<"$selection"

