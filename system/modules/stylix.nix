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
