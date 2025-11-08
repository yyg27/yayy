#!/usr/bin/env bash

selection=$(yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% --layout=reverse)
[[ -z "$selection" ]] && exit

xargs -r yay -S --noconfirm <<<"$selection"
