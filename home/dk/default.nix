{ ... }: {

  home.username = "dk";
  home.homeDirectory = "/home/dk";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;
    # extraConfig = ''
    #   Host *
    #     IdentityAgent ~/.1password/agent.sock
    # '';
  };

  programs.git = {
  };

  wayland.windowManager.hyprland.settings = {
    # "$terminal" = "ghostty";
    # "$fileManager" = "nautilus --new-window";
    # "$browser" = "chromium --new-window --ozone-platform=wayland";
    # "$music" = "spotify";
    # "$passwordManager" = "1password";
    # "$messenger" = "telegram-desktop";
    # "$webapp" = "$browser --app";

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
}
