{ pkgs, config, ... }: {
  home.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		nerd-fonts.fira-mono
		noto-fonts-color-emoji
  ];
		
  # Use the external dotfiles alacritty config for quicker hacking
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/alacritty";
}
