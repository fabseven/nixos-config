{pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    kdePackages.kate
  ];

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
