{ config, inputs, pkgs, ...}: {

  imports = [./hyprland/configuration.nix];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services.hyprpolkitagent.enable = true;
  
  # # I am too lazy to write a nix config for hyprland
  # home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/nixos-config/dotfiles/hypr";
}
