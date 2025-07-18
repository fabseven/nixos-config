# ThinkPad
{ ... }: {
  imports = [ 
    ../common.nix 
    ../modules/kanshi.nix
    ../modules/hyprland.nix
    ../modules/waybar-hl.nix
  ];

  home.stateVersion = "25.05";
}
