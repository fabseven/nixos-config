{ config, pkgs, ... }: {

home.packages.programs.helix = with pkgs; [
      bash-language-server
      biome
      clang-tools
      docker-compose-language-service
      dockerfile-language-server-nodejs
      golangci-lint
      golangci-lint-langserver
      gopls
      gotools
      helix-gpt
      marksman
      nil
      nixpkgs-fmt
      nodePackages.prettier
      nodePackages.typescript-language-server
      pgformatter
      (python3.withPackages (p: (with p; [
        black
        isort
        python-lsp-black
        python-lsp-server
      ])))
      rust-analyzer
      taplo
      taplo-lsp
      terraform-ls
      typescript
      vscode-langservers-extracted
      yaml-language-server

      languages = {
        language = [
          {
            name = "go";
            language-servers = [ "gopls" "golangci-lint-lsp" "gpt"];
            formatter = {
              command = "goimports";
            };
            auto-format = true;
          };
        ];
      };
  ];

  # I love TOML configs more
  home.file.".config/helix".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/helix";
}
