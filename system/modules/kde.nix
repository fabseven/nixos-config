{pkgs, ...}: {

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
  ];

  services = {
    xserver.enable = true;
    displayManager.ly.enable = true;
    xserver.desktopManager.plasma6.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}