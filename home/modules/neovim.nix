# The idea is to symlink dotfiles/nvim into .config/nvim,
# because I don't want nix to manage my nvim config. LazyVim does it.
{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    yaml-language-server
    vscode-langservers-extracted
    rust-analyzer
    solargraph
    shfmt
  ];

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
