#!/bin/bash

fedora-enable_repo(
    "erikreider/packages"
    "erikreider/SwayNotificationCenter"
    "swayfx/swayfx"
)

fedora-new_repo(
    "https://repository.mullvad.net/rpm/stable/mullvad.repo"
    "https://download.docker.com/linux/fedora/docker-ce.repo"
)

flatpak = (
    "flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
    "flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo"
)
