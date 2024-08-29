{ pkgs, config, nix-colors, ... }:

let
  colorScheme = nix-colors.colorSchemes.paraiso;
in {
  home.file.".config/swaylock/config".text = ''
    daemonize
    clock
    indicator
    datestr=%a, %B %e
    timestr=%I:%M %p
    effect-blur=5x5
    indicator-caps-lock
    show-failed-attempts
    ignore-empty-password
    indicator-thickness=10
    indicator-radius=120
    hide-keyboard-layout
    ring-color=${config.colorScheme.palette.base05}
    key-hl-color=${config.colorScheme.palette.base00}
    line-color=00000000
    inside-color=00000088
    inside-clear-color=00000088
    separator-color=00000000
    ring-ver-color=${config.colorScheme.palette.base04}
    inside-ver-color=00000000
    text-color=${config.colorScheme.palette.base05}
    text-ver-color=${config.colorScheme.palette.base05}
    text-clear-color=${config.colorScheme.palette.base05}
    bs-hl-color=${config.colorScheme.palette.base0F}
    ring-clear-color=${config.colorScheme.palette.base0F}
    font=JetBrains Mono
  '';
}
