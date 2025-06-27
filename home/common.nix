{ config, ... }: {
  imports = [
    ./modules/cli.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/lazygit.nix
    ./modules/neovim.nix
    ./modules/ssh.nix
    ./modules/xdg.nix
    ./modules/zsh.nix
    ./modules/syncthing.nix
    ./modules/ghostty.nix
    ./modules/helix.nix
    ./modules/proton.nix
  ];

  home = rec {
    username = "dk";
    homeDirectory = "/home/${username}";
    file = {
      ".local/bin".source =
        config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/scripts";
      ".p10k.zsh".source = 
        config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/dotfiles/p10k/p10k.zsh";
    };
  };

  # Dotfiles management
  xdg.configFile = {
    # Application configurations
    "alacritty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/alacritty";
      recursive = true;
    };
    "hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/hypr";
      recursive = true;
    };
    "ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/ghostty";
      recursive = true;
    };
    "helix" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/helix";
      recursive = true;
    };
    "kanshi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/kanshi";
      recursive = true;
    };
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/nvim";
      recursive = true;
    };
    "waybar-hl" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/waybar-hl";
      recursive = true;
    };
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
