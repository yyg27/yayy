#!/usr/bin/env bash

selection=$(pacman -Qqe | fzf --multi --preview 'pacman -Qi {1}' --preview-window=down:75% --layout=reverse --header="SELECT PACKAGES TO UNINSTALL")
[[ -z "$selection" ]] && exit

xargs -r sudo pacman -Rns --noconfirm <<<"$selection"
