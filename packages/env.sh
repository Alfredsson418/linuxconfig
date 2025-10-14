common_env=(
    "kitty" # Terminal
    "nautilus" # GUI File Manager
    "sddm"
    "tmux"
    "NetworkManager-tui"
    "htop" # System monitor tool
    "cifs-utils"
    "qimgv" # Image Viewing software
    # "ufw" # Maybe not install because dependent on iptables
	"converseen" # Image converter program
)

fedora_env=(
    "swayfx" # Tiling manager
    "waybar" # The top bar
    "swaysettings-git" # Settings menu
    "autotiling" # Auto tiling script
    "SwayNotificationCenter-git"
    "rofi-wayland" # Search Menu
    "grimshot" # Screenshot tool together with swappy
    "swappy"
    "swaylock" # Lock Screen
    "swayosd-git" # Backend server for different function buttons
    "xdg-desktop-portal-gtk"
    "xdg-desktop-portal-wlr"
    "adw-gtk3-theme"
    "pavucontrol" # PulseAudio volume control
    "sway-audio-idle-inhibit-git" # Does not lock down PC when audio is playing
    "nfs-utils"
)

flatpak_env=(
    "flathub it.mijorus.gearlever" # Run Appimages easy
    "flathub com.github.tchx84.Flatseal" # Change flatpak permissions etc
    "flathub com.spotify.Client"
    "flathub org.mozilla.firefox"
    "flathub org.videolan.VLC"
)
