{ inputs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {

    enable = true;

    polarity = "dark";

    base16Scheme = ./themes/vesper.yaml;

    image = ../../home/wallpaper.jpg;

    cursor.size = 18;

    # KDE's own target (targets.kde) themes Plasma's colorscheme directly;
    # the generic qt target would fight it, so it stays off.
    targets = {
      gtk.enable = true;
      qt.enable = false;
    };
  };
}
