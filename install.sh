#!/bin/bash

#####################################################################################
# todo:                                                                             #
# - [ ] include in script to download and set zsh as default                        #
# - [ ] zsh themes                                                                  #
# - [ ] install and make default sddm for login manager                             #
# - [ ] sddm themes                                                                 #
# - [ ] grub cutsomization too                                                      #
# - [ ] go over script and rewrite for streamlining (to be done a later future)     #
#####################################################################################

#
# Get the directory paths used by the bash script
#
script_dir=$(dirname "$(readlink -f "${0:A}")")
dotconfig_dir=script_dir/configs/

#
# given two directories, creates a symlink of the original directory in dest. directory
#
create_symlink() {
    original_dir=$1
    symlink_dir=$2

    if [ $# -eq 0 ]; then
        original_dir="$dotconfig_dir"/*
        symlink_dir="$HOME/.config"

    elif [ $# -eq 1 ]; then
        original_dir="$script_dir/$1"
        symlink_dir="$HOME/.config"

    else 
        original_dir="$script_dir/$1"
        symlink_dir="$2"
    fi

    ln -sf "$original_dir" "$symlink_dir"
}

#
# install apps and necessities
#

# pacman wrapper for convenience
sudo pacman -Syu
sudo pacman -S yay

# apps
yay -S discord keepassxc pdfarranger spotify xournalpp flatpak timeshift protonvpn nwg-look nemo xfce4-terminal kitty mako neovim swaylock-effects waybar-git wofi zathura zathura-pdf-mupdf

# app distribution; mainly used for access towards obsidian
flatpak update -y
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable

#
# create necessary symlinks
#

# kitty
create_symlink configs/kitty

# mako
create_symlink configs/mako

# nvim
create_symlink configs/nvim

# sway
create_symlink configs/sway

# swaylock
create_symlink configs/swaylock

# waybar
create_symlink configs/waybar

# wofi
create_symlink configs/wofi

# zathura
create_symlink configs/zathura

#
# remove unnecessary apps
#
sudo pacman -Rns nano
rm .nanorc
