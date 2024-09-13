{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    google-chrome
    _1password
    _1password-gui
  ];

  programs.google-chrome.enable = true;
}
