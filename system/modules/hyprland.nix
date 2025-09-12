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
    displayManager.gdm.enable = false;
    hypridle.enable = true;
    blueman.enable = true;
  };
  programs = {
    uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
      };
    };
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = true;
    };
    hyprlock.enable = true;
    nm-applet.enable = true;
  };
}
