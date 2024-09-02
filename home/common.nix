{ config, pkgs, ... }: {
  imports = [
    ./modules/cli.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/lazygit.nix
    ./modules/neovim.nix
    ./modules/ssh.nix
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/xdg.nix
    ./modules/zsh.nix
    ./modules/swaylock.nix
    # ./modules/lan-mouse.nix
    # ./services/gammarelay.nix
  ];

  home = rec {
    username = "dk";
    homeDirectory = "/home/${username}";
    file.".local/bin".source =
      config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/scripts";
  };

#customHelixTheme = pkgs.writeTextFile {
#   name = "tsodish";
#   destination = "../helix/tsodish.toml";
#   text = builtins.readFile ../helix/tsodish.toml;
# }; 

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
