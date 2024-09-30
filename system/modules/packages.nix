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
    python312Packages.cryptography
    python312Packages.chardet
    python312Packages.distro
    python312Packages.filelock
    python312Packages.google-api-python-client
    python312Packages.google-auth
    python312Packages.google-auth-oauthlib
    python312Packages.httplib2
    python312Packages.lxml
    python312Packages.passlib
    python312Packages.pathvalidate
    python312Packages.python-dateutil
    python312Packages.setuptools
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
