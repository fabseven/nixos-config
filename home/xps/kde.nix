# Dell XPS - KDE Configuration
{ ... }: {
  imports = [ 
    ../common.nix 
    ./sway.nix 
    ./waybar.nix 
    ./kanshi.nix 
  ];

  # Override desktop environment to KDE
  desktop.environment = "kde";

  home.stateVersion = "24.11";
}