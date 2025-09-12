{ config, inputs, pkgs, ...}: {

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
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

  programs.hyprlock = {
    enable = true;
    settings = {
      grace = 5;
      no_fade_in = false;
      disable_loading_bar = false;
    };
  };

  services.hyprpolkitagent.enable = true;
  
  # I am too lazy to write a nix config for hyprland
  xdg.configFile = {
    "hypr".source = ../../dotfiles/hypr;
    "wlogout".source = ../../dotfiles/wlogout;
  };
}
