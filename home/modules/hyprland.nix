{ config, inputs, pkgs, ...}: {

  #imports = [./hyprland/configuration.nix];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "wl-clip-persist --clipboard regular & clipse -listen"
      ];
      input = {
      kb_options = "ctrl:nocaps";
      accel_profile = "flat";
      sensitivity = 0.25;
        touchpad = {
          clickfinger_behavior = 2;
          natural_scroll = true;
          tap-to-click = true;
          drag_lock = true;
          disable_while_typing = true;
          middle_button_emulation = false;
        };
      };
      gestures = {
        workspace_swipe = true;
      };
      bind = [
        ",mouse:274, exec,"
      ];
    };
  };

  services.hyprpolkitagent.enable = true;
  
  # # I am too lazy to write a nix config for hyprland
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/dotfiles/hypr";
}
