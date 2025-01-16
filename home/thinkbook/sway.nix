{ config, pkgs, lib, ... }: {

  wayland.windowManager.sway = {
    config = {
      input = lib.mkAfter {
        "type:touchpad" = {
          left_handed = "disabled";
          tap = "enabled";
          natural_scroll = "disabled";
          # dwt = "enabled";
          accel_profile = "adaptive";
          pointer_accel = "0.4"; # set mouse sensitivity (between -1 and 1)
        };
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0.4";
        };
      };
      keybindings = let
        inherit (config.wayland.windowManager.sway.config) modifier menu;
        spotify = "${pkgs.playerctl}/bin/playerctl -p spotify";
      in lib.mkAfter {
        "${modifier}+d" = "exec ${menu}";
        "XF86MonBrightnessDown" = "exec 'light -U 10'";
        "XF86MonBrightnessUp" = "exec 'light -A 10'";
        "XF86AudioRaiseVolume" =
          "exec 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0'";
        "XF86AudioLowerVolume" =
          "exec 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1.0'";
        "XF86AudioMute" = "exec 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'";
        "XF86AudioMicMute" = "exec 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'";
        "XF86AudioPlay" = "exec '${spotify} play-pause'";
        "XF86AudioNext" = "exec '${spotify} next'";
        "XF86AudioPrev" = "exec '${spotify} previous'";
        "${modifier}+shift+s" = "exec 'screenshot.sh clipboard'";
      };

      # output = {
      #   HDMI-A-1 = {
      #     mode = "2560x1440@59.951Hz";
      #     pos = "2560 0";
      #     transform = "270";
      #     scale = "1.0";
      #     scale_filter = "nearest";
      #     adaptive_sync = "off";
      #     dpms = "on";
      #   };
      #   DP-2 = {
      #     mode = "2560x1440@59.951Hz";
      #     pos = "0 519";
      #     transform = "normal";
      #     scale = "1.0";
      #     scale_filter = "nearest";
      #     adaptive_sync = "off";
      #     dpms = "on";
      #   };
      # };

      startup = [
        {
          command = "blueman-applet";
          always = true;
        }
      ];
    };
    extraConfig = ''
      
    ''; 
  };

  services.swayidle = {
    enable = true;
    timeouts = let
      swayMsg = "${pkgs.sway}/bin/swaymsg";
      light = "${pkgs.light}/bin/light";
      resumeCommand = ''${swayMsg} "output * power on"'';
    in [
      {
        timeout = 600;
        command = "${light} -O; ${light} -T 0.2";
        resumeCommand = "${light} -I";
      }
      {
        timeout = 900;
        command = ''${swayMsg} "output * power off"'';
        inherit resumeCommand;
      }
      {
        timeout = 1200;
        command = "${pkgs.systemd}/bin/systemctl suspend & ${pkgs.swaylock}/bin/swaylock";
        inherit resumeCommand;
      }
    ];
  };
}
