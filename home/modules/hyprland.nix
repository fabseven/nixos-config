{pkgs, config, ...}: {
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/hypr";
}