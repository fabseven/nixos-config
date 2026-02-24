# ThinkPad
{ ... }:
{
  imports = [
    ../common.nix
    ../modules/kanshi.nix
    # ../modules/hyprland.nix
    # ../modules/waybar-hl.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
