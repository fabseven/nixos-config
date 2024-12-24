{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  environment = {

		gnome.excludePackages = with pkgs; [
			geary
			gnome-text-editor
			gnome-backgrounds
			gnome-music
			gnome-tour
			gnome-user-docs
			gnome-video-effects
			gnome-console
			gnome-contacts
			gnome-logs
			gnome-maps
		];

    systemPackages = with pkgs; [
			gnome-settings-daemon
    ];
  };
}
