{ pkgs, config, ... }: {
	/* programs.gnome-shell = {
		enable = true;
		extensions = [
			{ package = pkgs.gnomeExtensions.appindicator; }
			{ package = pkgs.gnomeExtensions.tophat; }
      { package = pkgs.gnomeExtensions.caffeine; }
      { package = pkgs.gnomeExtensions.undecorate; }
      { package = pkgs.gnomeExtensions.space-bar; }
      { package = pkgs.gnomeExtensions.notification-banner-position; }
      { package = pkgs.gnomeExtensions.just-perfection; }
      { package = pkgs.gnomeExtensions.alphabetical-app-grid; }
      { package = pkgs.gnomeExtensions.tactile; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
		];
	};
  dconf.settings = {
		"org/gnome/shell/extensions/just-perfection" = {
      dash = false;
      search = true;
      startup-status = 0; # disable the overview popup thing
      theme = false;
      window-maximized-on-create = true;
    };
		"org/gnome/shell/extensions/appindicator" = {
      icon-brightness = -0.1;
      icon-opacity = 255;
      icon-saturation = 0.8;
      icon-size = 18;
      tray-pos = "right";
    };
		"org/gnome/shell/extensions/caffeine" = {
      indicator-position = -1;
      indicator-position-index = -1;
      screen-blank = "never";
      show-indicator = "only-active";
      show-notifications = false;
      toggle-shortcut = [ "<Super>p" ];
    };
  }; */
}
