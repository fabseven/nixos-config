{ config, pkgs, lib, ... }: {
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
      };
      defaultSession = "cinnamon";
    };
    desktopManager.cinnamon.enable = true;
    libinput.enable = true;
  };

  environment.systemPackages = with pkgs; [
    cinnamon.cinnamon
    cinnamon.nemo
    cinnamon.cinnamon-control-center
    cinnamon.cinnamon-screensaver
    cinnamon.cinnamon-settings-daemon
    cinnamon.cinnamon-session
    cinnamon.cinnamon-translations
    cinnamon.muffin
    cinnamon.cinnamon-desktop
    cinnamon.cjs
    cinnamon.cinnamon-menus
    cinnamon.cinnamon-common
    # Add any other Cinnamon-related packages you want
  ];
} 
