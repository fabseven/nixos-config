# Lenovo ThinkPad X1 Nano G2
{ lib, ... }:
{
  imports = [
    ../common.nix
    ../modules/kanshi.nix
    ../modules/hyprland.nix
    ../modules/waybar-hl.nix
  ];

  # Override stylix default (18) — smaller cursor for high-DPI screen
  home.pointerCursor.size = lib.mkForce 14;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
