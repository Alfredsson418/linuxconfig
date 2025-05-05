echo "Generating new SSH key"
ssh-keygen -t ed25519 -b 4096 -C "SSH Key for $HOSTNAME" -f ~/.ssh/new_ssh_id -N ''
