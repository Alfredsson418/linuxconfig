#!/bin/bash

home_dir="$HOME/"
target_dir="./dotfiles"

dot_files=(".bashrc")

for i in "${dot_files[@]}"; do
    dir=$(readlink -f "$home_dir$i")
    target="$target_dir"
    mkdir -p $target
    echo "Copying from $dir to $target"
    cp -r "$dir" "$target_dir"
done

config_dir="$home_dir.config/"

config_dirs=("sway" "swaync" "waybar" "swaylock" "rofi" "kitty" "zed")

for i in "${config_dirs[@]}"; do
    dir=$(readlink -f "$config_dir$i")
    target="$target_dir/.config"
    mkdir -p $target
    echo "Copying from $dir to $target"
    cp -r "$dir" "$target"
done
