#!/usr/bin/env bash

selection=$(yay -Qq | fzf --multi --preview 'yay -Qi {1}' --preview-window=down:75% --layout=reverse --header="SELECT PACKAGES TO UNINSTALL")
[[ -z "$selection" ]] && exit

xargs -r yay -Rns --noconfirm <<<"$selection"
