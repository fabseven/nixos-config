{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    wayland
    wlr-randr
    wget
    tldr
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
    nautilus
    stockfish
    lm_sensors
    gping # ping with a graph
    trippy # network diagnostic https://github.com/fujiapple852/trippy
    mpv
		_1password-gui
    _1password
    gam
    zoom-us
    ticktick
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
