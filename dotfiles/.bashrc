# .bashrc

export PS1='\[\e[0;34m\]\u | \[\e[4;34m\]\w\[\e[0m\] \$ '


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Auth
if hash gnome-keyring-daemon 2>/dev/null; then
    eval "$(/usr/bin/gnome-keyring-daemon --start 2>/dev/null)"
    export SSH_AUTH_SOCK
fi
