{ pkgs, ... }: {
  # more in stylix.lua
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # terminal
		noto-fonts-color-emoji
		# iosevka
    # iosevka-bin
    # (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    # (nerdfonts.override { fonts = [ "FiraMono" "JetBrainsMono" ]; })
  ];
}
