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

echo "Downloading yayy.sh..."
sudo curl -sL https://raw.githubusercontent.com/yyg27/yayy/main/yayy.sh -o /usr/local/bin/yayy
sudo chmod +x /usr/local/bin/yayy

#for yayyrm.sh for removing packages
echo "Downloading yayyrm.sh..."
sudo curl -sL https://raw.githubusercontent.com/yyg27/yayy/refs/heads/main/yayyrm.sh -o /usr/local/bin/yayyrm
sudo chmod +x /usr/local/bin/yayyrm

echo "yayy and yayyrm installed successfully"
