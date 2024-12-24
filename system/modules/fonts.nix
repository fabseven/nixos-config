{ pkgs, ... }: {
  # more in stylix.lua
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # terminal
		noto-fonts-color-emoji
		noto-fonts-emoji-blob-bin
		noto-fonts
		# iosevka
    # iosevka-bin
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    # (nerdfonts.override { fonts = [ "FiraMono" "JetBrainsMono" ]; })
  ];
}
