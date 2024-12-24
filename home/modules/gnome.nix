{ pkgs, config, ... }: {
  dconf = {
    enable = true;
		settings = {
			"org/gnome/shell" = {
				disable-user-extensions = false;
				
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
