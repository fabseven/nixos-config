{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];
  };

	xdg.portal = {
		enable = true;
		wlr.enable = true;
	};

  environment = {

		gnome.excludePackages = with pkgs; [
			orca
			evince
			geary
			gnome-user-docs
			baobab
			epiphany
			gnome-text-editor
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
			dconf-editor
      adwaita-icon-theme
			gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.tophat
      gnomeExtensions.undecorate
      gnomeExtensions.space-bar
      gnomeExtensions.notification-banner-position
      gnomeExtensions.just-perfection
      gnomeExtensions.alphabetical-app-grid
      gnomeExtensions.tactile
      gnomeExtensions.blur-my-shell
    ];
  };
}
