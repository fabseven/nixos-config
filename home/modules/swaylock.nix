{ config, lib, ... }: {

let
  wallpaper = ../digital.jpg;
in {
  home.file.".config/swaylock/config".text = ''
    daemonize
    clock
    indicator
    datestr=%a, %B %e
    timestr=%I:%M %p
    effect-blur=5x5
    wallpaper=${wallpaper}
    indicator-caps-lock
    show-failed-attempts
    ignore-empty-password
    indicator-thickness=10
    indicator-radius=120
    hide-keyboard-layout
    line-color=00000000
    inside-color=00000088
    inside-clear-color=00000088
    separator-color=00000000
    inside-ver-color=00000000
    font=JetBrains Mono
  '';  
  };
}
