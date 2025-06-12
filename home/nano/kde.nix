# Nano - KDE Configuration
{ ... }: {
  imports = [ 
    ../common.nix 
    ./sway.nix 
    ./waybar.nix 
  ];

  # Override desktop environment to KDE
  desktop.environment = "kde";

  home.stateVersion = "24.11";
}