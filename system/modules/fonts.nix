{ pkgs, ... }: {
  # more in stylix.lua
  fonts.packages = with pkgs; [
    font-awesome # installed for waybar icons
    nerd-fonts.jetbrains-mono # terminal
		# iosevka
    # iosevka-bin
    # (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    # (nerdfonts.override { fonts = [ "FiraMono" "JetBrainsMono" ]; })
  ];
}
