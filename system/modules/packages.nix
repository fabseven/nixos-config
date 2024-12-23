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
		adwaita-icon-theme
    nautilus
    stockfish
    lm_sensors
    gping # ping with a graph
    trippy # network diagnostic https://github.com/fujiapple852/trippy
		distrobox
    mpv
		_1password-gui
    _1password
		lutris
		heroic
    zoom-us
    ticktick
		ulauncher
		inputs.zen-browser.packages."${system}"
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
