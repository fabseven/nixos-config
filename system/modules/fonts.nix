{ pkgs, ... }:
{
  # more in stylix.lua
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # terminal
    nerd-fonts.geist-mono
    nerd-fonts.fira-mono
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    # iosevka
    # iosevka-bin
    # (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    # (nerdfonts.override { fonts = [ "FiraMono" "JetBrainsMono" ]; })
  ];
}
