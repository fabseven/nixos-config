{pkgs, config, ...}: {
  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/waybar-hl";
}
