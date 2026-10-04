{ config, lib, ... }:
let
  inherit (config.stylix) fonts;
  font = size: "${fonts.sansSerif.name} ${toString size}";
in
{
  # Stylix's gtk target only writes org/gnome/desktop/interface. Cinnamon reads
  # its own org/cinnamon schemas, so mirror the stylix theme there.
  dconf.settings = {
    "org/cinnamon/desktop/interface" = {
      gtk-theme = config.gtk.theme.name;
      icon-theme = lib.attrByPath [ "gtk" "iconTheme" "name" ] "Adwaita" config;
      font-name = font fonts.sizes.applications;
    };
    "org/cinnamon/desktop/wm/preferences".titlebar-font = font fonts.sizes.desktop;
    "org/cinnamon/desktop/background" = {
      picture-uri = "file://${config.stylix.image}";
      picture-options = "zoom";
    };
    "org/nemo/preferences".default-folder-viewer = lib.mkDefault "list-view";
  };
}
