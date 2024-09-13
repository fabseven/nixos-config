{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    google-chrome
    _1password-gui
    _1password
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    politPolicyOwners = [ "dk" ]
  };
  
}
