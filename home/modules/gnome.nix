{ pkgs, config, ... }: {
  dconf = {
    enable = true;
		settings = {
			"org/gnome/shell" = {
				disable-user-extensions = false;
				
				enabled-extensions = [
					"appindicatorsupport@rgcjonas.gmail.com"
				];
			};
		};
  };
}
