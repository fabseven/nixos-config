{ pkgs, inputs, config, lib, ... }: {
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {

    enable = true;

		polarity = "dark";

    /* # https://tinted-theming.github.io/base16-gallery/
    base16Scheme = let theme = "catppuccin-mocha";
    in "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    override = {
      base00 = "#1f1e22";
      base01 = "#232224";
    }; */

		base16Scheme = "${inputs.tt-schemes}/base16/ayu-dark.yaml";

/*     image = ../../home/wallpaper.jpg;

		cursor.size = 18;
    cursor.package = pkgs.qogir-icon-theme;
    cursor.name = "Qogir"; */

		targets = {
			gtk.enable = true;
			qt = {
				enable = true;
				platform = lib.mkForce "qtct";
			};
		};

/*     fonts = rec {
      sansSerif = {
        package = pkgs.raleway;
        name = "Raleway";
      }; 

      serif = monospace;
      sansSerif = monospace;

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    }; */
  };
}
