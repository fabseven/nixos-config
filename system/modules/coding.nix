{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    neovim
    helix
    helix-gpt
    git
    lazygit
    gh
    gcc
    gnumake
    nodejs
    go
    cargo
    luarocks
    stylua
    tree-sitter
    jdk
    python3
    ruby
    rubyPackages_3_3.solargraph
    sbt
    scala
    powershell
    coursier # required by metals
    metals
    scala-cli
    corepack
    dart-sass
    delta
    pyright
    cargo
    rustc
    rust-analyzer
    taplo # TOML language server
    marksman # markdown language server
    http-server
    meld
    ansible
    vscode
  ];

  programs.java.enable = true;

}
