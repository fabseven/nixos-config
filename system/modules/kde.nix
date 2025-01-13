{pkgs, ...}: {

 #environment.plasma6.excludePackages = with pkgs.kdePackages; [
 #  plasma-browser-integration
 #  konsole
 #  elisa
 #];

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
