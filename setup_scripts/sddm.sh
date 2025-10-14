#!/bin/bash

# https://github.com/Keyitdev/sddm-astronaut-theme?tab=readme-ov-file

sudo dnf install -y sddm qt6-qtsvg qt6-qtvirtualkeyboard qt6-qtmultimedia

sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme

sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/

theme_path="/usr/share/sddm/themes/sddm-astronaut-theme"
new_color="#bf1d00"

# Replace
# sudo sed -i "s/^Current=.*$/Current=sddm-astronaut-theme/" \
#     /etc/sddm.conf
sudo sed -i "s/$(grep 'Current=' /etc/sddm.conf)/Current=sddm-astronaut-theme/g" /etc/sddm.conf

# Add
echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf

sudo cp $(pwd)/dotfiles/.config/sway/assets/bg-original.png $theme_path/Backgrounds/astronaut.png

sudo sed -i 's/PartialBlur="true"/PartialBlur="false"/g' $theme_path/Themes/astronaut.conf

sudo sed -i "s/^DateTextColor=.*$/DateTextColor=\"${new_color}\"/" \
	"${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^HeaderTextColor=.*$/HeaderTextColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^TimeTextColor=.*$/TimeTextColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^LoginFieldTextColor=.*$/LoginFieldTextColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^UserIconColor=.*$/UserIconColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^PasswordIconColor=.*$/PasswordIconColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^LoginButtonBackgroundColor=.*$/LoginButtonBackgroundColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^DateTextColor=.*$/DateTextColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^SystemButtonsIconsColor=.*$/SystemButtonsIconsColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^SessionButtonTextColor=.*$/SessionButtonTextColor=\"${new_color}\"/" \
	"${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^VirtualKeyboardButtonTextColor=.*$/VirtualKeyboardButtonTextColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

sudo sed -i "s/^WarningColor=.*$/WarningColor=\"${new_color}\"/" \
    "${theme_path}/Themes/astronaut.conf"

