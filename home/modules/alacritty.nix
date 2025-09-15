{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-mono
    noto-fonts-color-emoji
  ];

  # Use the external dotfiles alacritty config for quicker hacking
  xdg.configFile."alacritty".source = ../../dotfiles/alacritty;
}
