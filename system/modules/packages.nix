{ pkgs, inputs, ... }:
{

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
    firefox
    unzip
    dtrx
    signal-desktop
    yazi
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.tumbler
    spotify
    playerctl
    gimp
    discord
    zed-editor
    gthumb
    feh
    libnotify
    ulauncher
    adwaita-icon-theme
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
    moonlight-qt
    parsec-bin
    stockfish
    lm_sensors
    gping # ping with a graph
    trippy # network diagnostic https://github.com/fujiapple852/trippy
    mpv
    hyprpaper
    hyprsunset
    wiremix
    wofi
    wlogout
    swaynotificationcenter
    solaar
    flameshot
    lutris
    heroic
    #zoom-us
    ticktick
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    brave
    impala
    bottles-unwrapped
    google-chrome
    telegram-desktop
    netflix
    slack
    slack-term
    fastfetch
  ];

}
