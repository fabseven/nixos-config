{ pkgs, config, ...}: {
  home.packages = with pkgs; [
		#nerd-fonts.jetbrains-mono
		nerd-fonts.fira-mono
		nerd-fonts.geist-mono
		noto-fonts-color-emoji
  ];
  xdg.configFile."ghostty".source = ../../dotfiles/ghostty;
}
