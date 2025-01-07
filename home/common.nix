{ config, pkgs, ... }: {
  imports = [
    ./modules/cli.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/lazygit.nix
    ./modules/neovim.nix
		#./modules/alacritty.nix
    ./modules/ssh.nix
    #./modules/sway.nix
    #./modules/waybar.nix
		#./modules/waybar-hl.nix
		./modules/gnome.nix
    ./modules/xdg.nix
    ./modules/zsh.nix
    #./modules/swaylock.nix
    ./modules/syncthing.nix
    # ./modules/hyprlock.nix
    #./modules/kanshi.nix
		#./modules/hyprland.nix
		./modules/ghostty.nix
    ./modules/helix.nix
		./modules/proton.nix
    # ./modules/lan-mouse.nix
    # ./services/gammarelay.nix
  ];

  home = rec {
    username = "dk";
    homeDirectory = "/home/${username}";
    file.".local/bin".source =
      config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/scripts";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
