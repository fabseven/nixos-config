{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
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
			dconf-editor
			gnome-settings-daemon
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
