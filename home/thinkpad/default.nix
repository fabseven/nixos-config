# ThinkPad
{ ... }: {
  imports = [ 
    ../common.nix 
    ../modules/kanshi.nix
    ../modules/hyprland.nix
    ../modules/hyprlock.nix
  ];

  home.stateVersion = "25.05";
}
