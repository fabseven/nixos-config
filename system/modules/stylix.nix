{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {

    enable = true;

		polarity = "dark";

    # https://tinted-theming.github.io/base16-gallery/
    base16Scheme = let theme = "catppuccin-mocha";
    in "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    override = {
      base00 = "#1f1e22";
      base01 = "#232224";
    };

    image = ../../home/wallpaper.jpg;

		cursor.size = 18;

    fonts = rec {
      /* sansSerif = {
        package = pkgs.raleway;
        name = "Raleway";
      }; */

      serif = monospace;
      sansSerif = monospace;

      monospace = {
        package = pkgs.geist-mono;
        name = "Geist Mono";
      };
      # monospace = {
      #   package = pkgs.fira-code;
      #   name = "Fira Code";
      # };

      # monospace = {
      #   package = pkgs.iosevka-bin;
      #   name = "Iosevka Term";
      # };

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
    };
  };
}
