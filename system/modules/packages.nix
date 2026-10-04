{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
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
    moonlight-qt
    parsec-bin
    stockfish
    lm_sensors
    gping # ping with a graph
    trippy # network diagnostic https://github.com/fujiapple852/trippy
    mpv
    wiremix
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
    claude-code
    google-chrome
    telegram-desktop
    netflix
    slack
    slack-term
    fastfetch
  ];

}
