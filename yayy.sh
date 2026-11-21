#!/usr/bin/env bash
# usage: yayy [-p]   -p: AUR packages by popularity first (downloads ~11MB metadata), default: by name
repo=$(yay -Slq --repo)

if [[ "$1" == "-p" ]]; then
    aur=$(curl -fsSL "https://aur.archlinux.org/packages-meta-v1.json.gz" | gunzip | jq -r 'sort_by(-.Popularity)[].Name')
    list=$(echo -e "$aur\n$repo" | awk '!seen[$0]++')
else
    aur=$(curl -fsSL "https://aur.archlinux.org/packages.gz" | gunzip)
    list=$(echo -e "$repo\n$aur" | sort -u)
fi

selection=$(fzf --multi --tiebreak=index --preview 'yay -Sii {1}' --preview-window=down:75% --layout=reverse <<<"$list")
[[ -z "$selection" ]] && exit

xargs -ro yay -S <<<"$selection"
