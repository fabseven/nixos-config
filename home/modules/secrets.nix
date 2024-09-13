{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    google-chrome
    1password-gui
    1password
  ];

  programs.1password.enable = true;
  programs.1password-gui = {
    enable = true;
    politPolicyOwners = [ "dk" ]
  };
  
}
