{ pkgs, ... }:
{
  # Lives next to KDE: pick the session at the SDDM login screen to toggle.
  services.xserver.desktopManager.cinnamon.enable = true;

  # Stylix has no Cinnamon target; the vesper colors reach it through the GTK
  # theme (see home/modules/cinnamon.nix for the dconf side).
  environment.systemPackages = with pkgs; [
    dconf-editor
  ];
}
