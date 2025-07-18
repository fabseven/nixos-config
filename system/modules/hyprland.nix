{ pkgs, ...}: {

  environment = {
    systemPackages = with pkgs; [
      pyprland
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

  security.polkit.enable = true;

	services = {
    xserver = {
      enable = true;
      displayManager.ly.enable = true;
    };

    gnome.gnome-keyring.enable = true;

    hypridle.enable = true;
    blueman.enable = true;
  };
  programs = {
    nm-applet.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };
  };

}
