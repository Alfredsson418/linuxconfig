#!/bin/bash

if command -v stow 2>/dev/null; then
    echo "✅ Stow is already installed at: $(command -v stow)"
else
    echo "⬇️ Stow is not installed. Installing..."

    sudo dnf install stow
fi

currentDir="$(pwd)"
echo "$currentDir"

# -t = target
stow --adopt -t $HOME -d $currentDir -R dotfiles
