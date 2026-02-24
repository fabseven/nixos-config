{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
  ];
}
