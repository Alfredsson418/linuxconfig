sudo dnf update -y

read -rp "You will need too reboot if any new linux headers in installed, do you wish to reboot? [y/n] " nvidia_reboot
if [[ $nvidia_reboot == y ]]; then
    reboot;
else
    sudo systemctl disable gdm.service
    sudo systemctl enable sddm.service
fi
