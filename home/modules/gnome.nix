{ pkgs, config, lib, ... }: {
  dconf = {
    enable = true;
		settings = {
			/* "org/gnome/desktop/interface" = lib.mkForce {
				color-scheme = "prefer-dark";
			}; */
			"org/gnome/shell" = {
				disable-user-extensions = false;

				favorite-apps = [
					"spotify.desktop"
				];
				
				enabled-extensions = [
					"appindicatorsupport@rgcjonas.gmail.com"
					"AlphabeticalAppGrid@stuarthayhurst"
					"blur-my-shell@aunetx"
					"just-perfection-desktop@just-perfection"
					"notification-position@drugo.dev"
					"space-bar@luchrich"
					"tactile@lundal.io"
					"undecorate@sun.wxg@gmail.com"
				];
			};
		};
  };
}
