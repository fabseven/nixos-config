{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.desktop;
in
{
  options.desktop = {
    enable = mkEnableOption "desktop environment home configuration";
    
    environment = mkOption {
      type = types.enum [ "gnome" "kde" "both" ];
      default = "gnome";
      description = ''
        Which desktop environment configuration to enable.
        Should match the system desktop.environment setting.
      '';
    };
  };

  # Import desktop-specific configurations
  imports = [
    (mkIf (cfg.enable && (cfg.environment == "gnome" || cfg.environment == "both")) ./gnome.nix)
    (mkIf (cfg.enable && (cfg.environment == "kde" || cfg.environment == "both")) ./kde.nix)
  ];

  config = mkIf cfg.enable {
    # Common desktop packages
    home.packages = with pkgs; [
      # Common desktop applications
      flameshot
      element-desktop
      vscode
      
      # Common fonts
      jetbrains-mono
      inter
    ];

    # Common desktop services
    services = {
      # Enable desktop notifications
      dunst.enable = mkDefault false; # Let desktop handle notifications
    };

    # Common XDG configuration
    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };

    # Common program configurations
    programs = {
      firefox = {
        enable = true;
        # Add common Firefox configuration here
      };
    };
  };
}