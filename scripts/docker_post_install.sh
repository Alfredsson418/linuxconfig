#!/bin/bash

# Fedora

sudo systemctl enable --now docker

sudo groupadd docker

sudo usermod -aG docker $USER
