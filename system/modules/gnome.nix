{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];
  };
  environment = {
    systemPackages = with pkgs; [
      adwaita-icon-theme
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.pop-shell
    ];
  };
}
