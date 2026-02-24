# Lenovo ThinkBook (kimchi)
{ ... }:
{
  imports = [
    ../common.nix
    ./sway.nix
    ./waybar.nix
  ];

  home.stateVersion = "24.11";
}
