#!/bin/bash

flatpak_remotes=(
    "flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
    "flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo"
)

echo "Copying dotfiles to $USER"
cp -rT ./dotfiles ~

read -rp "Do you wish to remove standard Flatpak remotes? [y/n] " del_flatpak_remotes
if [[ $del_flatpak_remotes == y ]]; then
    echo "Deleting default flapak remote"
    sudo flatpak remote-delete fedora
    sudo flatpak remote-delete flathub
fi


read -rp "Do you wish to add Flatpak remotes? [y/n] " add_flatpak_remotes
if [[ $add_flatpak_remotes == y ]]; then
    echo "Adding flatpak remotes"
    for i in "${flatpak_remotes[@]}"; do
        echo "flatpak remote-add --if-not-exists $i"
        flatpak remote-add --if-not-exists $i
    done
fi


echo " "

read -rp "Do you wish to add and enable fedora copr repos and remote repos? [y/n] " add_fedora_repos
if [[ $add_fedora_repos == y ]]; then
    source ./packages/sources.sh

    # Adding COPR repos
    for i in "${fedora_copr_repo[@]}"; do
        echo "Enabling copr repo $i"
        sudo dnf copr enable -y $i
    done

    echo " "

    # Adding new repos
    for i in "${fedora_new_repo[@]}"; do
        echo "Adding new repo $i"
        sudo dnf config-manager addrepo --from-repofile=$i
    done

fi


echo " "

read -rp "Do you wish to install development tools? [y/n] " dev_tools
if [[ $dev_tools == y ]]; then

    echo " "

    source ./packages/dev.sh

    echo "Installing Zed"

    # Check if Zed is already installed
    if command -v zed 2>/dev/null; then
        echo "✅ Zed is already installed at: $(command -v zed)"
    else
        echo "⬇️ Zed is not installed. Installing..."

        # Download and run the official install script safely
        curl -fsSL https://zed.dev/install.sh -o /tmp/install_zed.sh

        if [ -s /tmp/install_zed.sh ]; then
            chmod +x /tmp/install_zed.sh
            /bin/bash /tmp/install_zed.sh
        else
            echo "❌ Failed to download the installer."
        fi
    fi

    echo " "

    echo "Installing via dnf: ${common_dev[@]} ${fedora_dev[@]}"
    sudo dnf install -y "${common_dev[@]}" "${fedora_dev[@]}"

    echo " "

    echo "Installing via flatpak ${flatpak_dev[@]}"
    for i in "${flatpak_dev[@]}"; do
        echo "flatpak remote-add --if-not-exists $i"
        flatpak install -y $i
    done
fi

echo " "


read -rp "Do you wish to install enviroment applications? [y/n] " env_apps
if [[ $env_apps == y ]]; then

    echo " "

    source ./packages/env.sh

    echo "Installing via dnf: ${common_env[@]} ${fedora_env[@]}"
    sudo dnf install -y "${common_env[@]}" "${fedora_env[@]}"

    echo "Installing via flatpak ${flatpak_env[@]}"
    for i in "${flatpak_env[@]}"; do
        echo "flatpak remote-add --if-not-exists $i"
        flatpak install -y $i
    done



fi

echo " "

read -rp "Do you wish to install gaming applications and tools? [y/n] " gaming_apps
if [[ $gaming_apps == y ]]; then

    # https://docs.fedoraproject.org/sv/gaming/proton/

    echo "Installing Steam"
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

    source ./packages/gaming.sh

    echo "Installing via dnf: ${fedora_env[@]}"
    sudo dnf install -y "${fedora_gaming[@]}"

    echo "Installing via flatpak ${flatpak_gaming[@]}"
    for i in "${flatpak_gaming[@]}"; do
        echo "flatpak remote-add --if-not-exists $i"
        flatpak install -y $i
    done
fi

read -rp "Do you wish to install Privacy applications and tools? [y/n] " privacy_apps
if [[ $privacy_apps == y ]]; then

    source ./packages/privacy.sh

    echo "Installing via dnf: ${common_privacy[@]}"
    sudo dnf install -y "${common_privacy[@]}"

    echo "Installing via flatpak ${flatpak_privacy[@]}"
    for i in "${flatpak_privacy[@]}"; do
        echo "flatpak remote-add --if-not-exists $i"
        flatpak install -y $i
    done
fi

read -rp "Do you wish to remove some pre-installed applications? [y/n] " delete_apps
if [[ $delete_apps == y ]]; then

    source ./packages/delete.sh

    echo "Delete via dnf: ${common_delete[@]}"
    sudo dnf remove -y --noautoremove "${common_delete[@]}"
fi

read -rp "Do you wish to generare a new ssh key? [y/n] " ssh_key
if [[ $ssh_key == y ]]; then
    bash ./scripts/ssh_keygen.sh

fi

read -rp "Do you wish to run docker post install script? [y/n] " docker_post
if [[ $docker_post == y ]]; then
    bash ./scripts/docker_post_install.sh

fi


read -rp "Do you wish to install fonts? [y/n] " font_install
if [[ $font_install == y ]]; then
    bash ./scripts/fonts.sh

fi

read -rp "Do you wish to install Nvidia drivers? (This will update the system)[y/n] " nvidia_drivers
# https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla
if [[ $nvidia_drivers == y ]]; then
    bash ./scripts/nvidia_driver_install.sh
fi
