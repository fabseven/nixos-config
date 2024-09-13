{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    google-chrome
  ];

  programs.google-chrome.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "dk" ];
  };
}
