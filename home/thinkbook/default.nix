# Lenovo ThinkPad X1 Nano G2
{ ... }:
{
  imports = [
    ../common.nix
    ./sway.nix
    ./waybar.nix
  ];

  home.stateVersion = "24.11";
}
