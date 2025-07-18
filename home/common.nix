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

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
