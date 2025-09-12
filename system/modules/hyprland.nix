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
      withUWSM = true;
    };
    nm-applet.enable = true;
  };
}
