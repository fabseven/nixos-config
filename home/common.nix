{ config, ... }:
{
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
    ./modules/proton.nix
    ./modules/obs.nix
    ./modules/cinnamon.nix
    ./modules/tailscale.nix
  ];

  home = rec {
    username = "dk";
    homeDirectory = "/home/${username}";
    file = {
      ".local/bin".source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/scripts";
      ".p10k.zsh".source =
        config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/dotfiles/p10k/p10k.zsh";
    };
  };

  # Home Manager's stylix module has its own targets; the Kvantum qt target
  # exports QT_STYLE_OVERRIDE=kvantum, which breaks Plasma's QML (no panel).
  stylix.targets.qt.enable = false;

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
