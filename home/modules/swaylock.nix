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
    ring-color=${colorScheme.base0D}
    key-hl-color=${colorScheme.base00}
    line-color=00000000
    inside-color=00000088
    inside-clear-color=00000088
    separator-color=00000000
    ring-ver-color=${colorScheme.base04}
    inside-ver-color=00000000
    text-color=${colorScheme.base05}
    text-ver-color=${colorScheme.base05}
    text-clear-color=${colorScheme.base05}
    bs-hl-color=${colorScheme.base0F}
    ring-clear-color=${colorScheme.base0F}
    font=JetBrains Mono
  '';
}
