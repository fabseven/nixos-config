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
    luarocks
    stylua
    tree-sitter
    jdk
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
    pyright
    cargo
    rustc
    http-server
    meld
    ansible
    vscode
  ];

  programs.java.enable = true;

}
