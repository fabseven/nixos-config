{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.desktop;
in
{
  options.desktop = {
    enable = mkEnableOption "desktop environment";
    
    environment = mkOption {
      type = types.enum [ "gnome" "kde" "both" ];
      default = "gnome";
      description = ''
        Which desktop environment to enable.
        - "gnome": GNOME desktop only
        - "kde": KDE Plasma desktop only  
        - "both": Both desktops available at login
      '';
    };
  };

  # Import desktop environments based on selection
  imports = [
    (mkIf (cfg.enable && (cfg.environment == "gnome" || cfg.environment == "both")) ./gnome.nix)
    (mkIf (cfg.enable && (cfg.environment == "kde" || cfg.environment == "both")) ./kde.nix)
  ];

  config = mkIf cfg.enable {
    # Common desktop packages and services
    environment.systemPackages = with pkgs; [
      # Common applications
      firefox
      flameshot
      wl-clipboard
      xclip
    ];

    # Audio support
    services = {
      pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
        jack.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
      };
    } // (mkIf (cfg.environment == "both") {
      # If both are enabled, set up proper conflict resolution
      xserver.displayManager = {
        # Use SDDM as it supports both GNOME and KDE better
        sddm.enable = mkForce true;
        gdm.enable = mkForce false;
      };
    });

    # Common fonts
    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      inter
    ];
  };
}