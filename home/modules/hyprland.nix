{pkgs, config, ...}: {
  # I am too lazy to write a nix config for hyprland
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/hypr";
}