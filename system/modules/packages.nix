{ pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [
    wayland
    wlr-randr
    wget
    tldr
		pciutils
		lshw
    xdg-utils
    glib
    ffmpeg
    btop
    firefox
    unzip
    dtrx
    signal-desktop
    ranger
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.tumbler
    neofetch
    spotify
    playerctl
    gimp
		way-displays
    discord
		wdisplays
    zed-editor
    gthumb
    feh
    libnotify
		dconf-editor
		gnome-tweaks
    ulauncher
		adwaita-icon-theme
		inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    nautilus
    moonlight-qt
    parsec-bin
    stockfish
    lm_sensors
    gping # ping with a graph
    trippy # network diagnostic https://github.com/fujiapple852/trippy
		distrobox
    mpv
		_1password-gui
    _1password-cli
		hyprpaper
		wofi
		wlogout
		swaynotificationcenter
		waybar
		solaar
		flameshot
		lutris
		heroic
		#zoom-us
    ticktick
		ulauncher
		inputs.zen-browser.packages."${system}".default
    wlogout
    gnome-keyring
    bottles-unwrapped
    google-chrome
    telegram-desktop
		tailscale
    netflix
		brave
		slack
		slack-term
		kanshi
    fastfetch
  ];

}
