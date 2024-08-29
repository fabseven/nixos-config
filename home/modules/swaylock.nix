{ pkgs, config, nix-colors, ... }:

let
  colorScheme = nix-colors.colorSchemes.paraiso;
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
    ring-color=${colorScheme.palette.base0D}
    key-hl-color=${colorScheme.palette.base00}
    line-color=00000000
    inside-color=00000088
    inside-clear-color=00000088
    separator-color=00000000
    ring-ver-color=${colorScheme.palette.base04}
    inside-ver-color=00000000
    text-color=${colorScheme.palette.base05}
    text-ver-color=${colorScheme.palette.base05}
    text-clear-color=${colorScheme.palette.base05}
    bs-hl-color=${colorScheme.palette.base0F}
    ring-clear-color=${colorScheme.palette.base0F}
    font=JetBrains Mono
  '';
}
