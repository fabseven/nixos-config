{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      cursor_blink_interval = 0;
      # Omarchy look
      font_family = "JetBrainsMono Nerd Font";
      font_size = 12;
      window_padding_width = 14;
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
      cursor_shape = "block";
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };
    shellIntegration.enableZshIntegration = true;
    keybindings = {
      "ctrl+insert" = "copy_to_clipboard";
      "shift+insert" = "paste_from_clipboard";
      "shift+enter" = "send_text all \\e[13;2u";
      "alt+shift+enter" = "send_text all \\e[13;4u";
      "alt+p" = "paste_from_clipboard";
      "ctrl+pagedown" = "change_font_size current -1.0";
      "ctrl+pageup" = "change_font_size current +1.0";
      "ctrl+f5" = "load_config_file";
      "kitty_mod+Enter" = "launch --type=os-window --cwd=current";
    };
    extraConfig =
      let
        kitty-remote = ''
          # the following is for kitty-remote https://github.com/mikesmithgh/kitty-scrollback.nvim?tab=readme-ov-file#%EF%B8%8F-setup
          allow_remote_control socket-only
          listen_on unix:/tmp/kitty
          shell_integration enabled
          # Browse scrollback buffer in nvim
          map kitty_mod+h kitty_scrollback_nvim
          # Browse output of the last shell command in nvim
          map kitty_mod+g kitty_scrollback_nvim --config ksb_builtin_last_cmd_output
        '';
      in
      ''
        include ${../../dotfiles/kitty/vesper.conf}
        scrollback_lines 9000
        scrollback_pager_history_size 32

        ${kitty-remote}
      '';
  };
}
