{ inputs, pkgs, ...}: {

  environment = {
    systemPackages = with pkgs; [
      pyprland
      hyprshot
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

	services = {
    gnome.gnome-keyring.enable = true;
    displayManager.ly.enable = true;

    hypridle.enable = true;
    blueman.enable = true;
  };
  programs = {
    uwsm.enable = true;
    nm-applet.enable = true;
    # hyprland = {
    #   enable = true;
    #   package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #   portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # };
  };
}
