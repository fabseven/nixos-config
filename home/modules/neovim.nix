# The idea is to symlink dotfiles/nvim into .config/nvim,
# because I don't want nix to manage my nvim config. LazyVim does it.
{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    yaml-language-server
    vscode-langservers-extracted
    prettierd
    rust-analyzer
    solargraph
    shfmt
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-json-languageserver
  ];

  #xdg.configFile."nvim".source = "${config.home.homeDirectory}/nixos-config/nvim";

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/nvim";
}
