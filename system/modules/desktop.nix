{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.desktop;
in
{
  options.desktop = {
    enable = mkEnableOption "desktop environment";
    
    environment = mkOption {
      type = types.enum [ "cinnamon" ];
      default = "cinnamon";
      description = ''
        Which desktop environment to enable.
        Currently only Cinnamon is supported.
      '';
    };
  };

  imports = [
    ./cinnamon.nix
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
    };

    # Common fonts
    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      inter
    ];
  };
}