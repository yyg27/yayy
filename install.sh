#!/bin/bash

set -e

echo "Installing yayy..."

#check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "fzf not found. Installing..."
    sudo pacman -S --needed fzf
fi

#check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Please install yay first."
    exit 1
fi

echo "Downloading yayy..."
sudo curl -sL https://raw.githubusercontent.com/yyg27/yayy/main/yayy.sh -o /usr/local/bin/yayy
sudo chmod +x /usr/local/bin/yayy

echo "yayy installed successfully"
