{pkgs, config, ...}: {
  home.packages = with pkgs; [
		#nerd-fonts.jetbrains-mono
		nerd-fonts.fira-mono
		nerd-fonts.geist-mono
		noto-fonts-color-emoji
		ghostty
  ];

  home.file.".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/ghostty";
}
