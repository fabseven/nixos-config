{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
		gnome.gnome-keyring.enable = true;
  };

  environment = {

		sessionVariables = {
			NIXOS_OZONE_WL = 1;
		};

		gnome.excludePackages = with pkgs; [
			pkgs.gnome-backgrounds
			pkgs.gnome-maps
			pkgs.gnome-music
			pkgs.gnome-tour
			pkgs.gnome-user-docs
			pkgs.gnome-video-effects
		];

    systemPackages = with pkgs; [
			gnomeExtensions.appindicator
			gnomeExtensions.tophat
			gnomeExtensions.caffeine
			gnomeExtensions.undecorate
			gnomeExtensions.space-bar
			gnomeExtensions.just-perfection
			gnomeExtensions.tactile
			gnomeExtensions.blur-my-shell
    ];
  };
}
