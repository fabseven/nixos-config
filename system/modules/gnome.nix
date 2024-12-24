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
			evince
			geary
			gnome-user-docs
			baobab
			epiphany
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
			simple-scan
			snapshot
			totem
			yelp
			gnome-software
		];

    systemPackages = with pkgs; [
			gnome-settings-daemon
    ];
  };
}
