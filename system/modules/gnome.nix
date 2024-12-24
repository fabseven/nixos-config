{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  environment = {
		gnome.excludePackages = with pkgs.gnome; [
			pkgs.gnome-backgrounds
			pkgs.gnome-maps
			pkgs.gnome-music
			pkgs.gnome-tour
			pkgs.gnome-user-docs
			pkgs.gnome-video-effects
		];

    systemPackages = with pkgs; [
			gnome-settings-daemon
    ];
  };
}
