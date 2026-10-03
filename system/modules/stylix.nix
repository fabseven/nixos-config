{ inputs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {

    enable = true;

    polarity = "dark";

    base16Scheme = ./themes/vesper.yaml;

    image = ../../home/wallpaper.jpg;

    # stylix.cursor needs name + package + size all set together (or none at
    # all); leave it unset for now and let KDE's default cursor apply.

    # KDE's own target (targets.kde) themes Plasma's colorscheme directly;
    # the generic qt target would fight it, so it stays off.
    targets = {
      gtk.enable = true;
      qt.enable = false;
    };
  };
}
