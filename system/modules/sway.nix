{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    sway
    glib # gsettings
    swaylock
    hyprlock
    swayidle
    grim
    slurp
    #mako # notification daemon
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    xdg-utils
    waybar
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  hardware.graphics.enable = true;

  # required for hm sway? https://nixos.wiki/wiki/Sway
  security.polkit.enable = true;

  # faster sway maybe? https://nixos.wiki/wiki/Sway
  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = 1;
    }
  ];
}
