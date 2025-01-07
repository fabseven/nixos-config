{pkgs, config, ...}: {
  /* home.packages = with pkgs; [
    waybar
  ]; */

	programs.wayland.enable = true;

  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/waybar-hl";
}
