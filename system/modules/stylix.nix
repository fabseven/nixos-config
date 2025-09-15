{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {

    enable = true;

    polarity = "dark";

    /*
      # https://tinted-theming.github.io/base16-gallery/
      base16Scheme = let theme = "catppuccin-mocha";
      in "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

      override = {
        base00 = "#1f1e22";
        base01 = "#232224";
      };
    */

    base16Scheme = "${inputs.tt-schemes}/base16/gruvbox-dark-medium.yaml";

    image = ../../home/wallpaper.jpg;

    cursor.size = 18;
    cursor.package = pkgs.rose-pine-hyprcursor;
    cursor.name = "Rose Pine Hyprcursor";

    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };
}
