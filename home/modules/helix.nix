{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bash-language-server
    biome
    clang-tools
    docker-compose-language-service
    dockerfile-language-server-nodejs
    golangci-lint
    golangci-lint-langserver
    gopls
    gotools
    nil
    nixpkgs-fmt
    nodePackages.typescript-language-server
    pgformatter
    (python3.withPackages (
      p:
      (with p; [
        black
        isort
        python-lsp-black
        python-lsp-server
      ])
    ))
    terraform-ls
    typescript
    vscode-langservers-extracted
    yaml-language-server
  ];

  xdg.configFile."helix".source = ../../dotfiles/helix;

  programs.helix = {
    languages = {
      language = [
        {
          name = "go";
          language-servers = [
            "gopls"
            "golangci-lint-lsp"
            "gpt"
          ];
          formatter = {
            command = "goimports";
          };
          auto-format = true;
        }
        {
          name = "javascript";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
            "gpt"
          ];
          auto-format = true;
        }
        {
          name = "json";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.json"
            ];
          };
          auto-format = true;
        }
        {
          name = "jsonc";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.jsonc"
            ];
          };
          file-types = [
            "jsonc"
            "hujson"
          ];
          auto-format = true;
        }
        {
          name = "jsx";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
            "gpt"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.jsx"
            ];
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
          };
          auto-format = true;
        }
        {
          name = "python";
          language-servers = [
            "pylsp"
            "gpt"
          ];
          formatter = {
            command = "sh";
            args = [
              "-c"
              "isort --profile black - | black -q -"
            ];
          };
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "gpt"
          ];
          auto-format = true;
        }
        {
          name = "sql";
          language-servers = [ "gpt" ];
          formatter = {
            command = "pg_format";
            args = [
              "-iu1"
              "--no-space-function"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = [ "taplo" ];
          formatter = {
            command = "taplo";
            args = [
              "fmt"
              "-o"
              "column_width=120"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "tsx";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
            "gpt"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.tsx"
            ];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
            "gpt"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.ts"
            ];
          };
          auto-format = true;
        }
      ];
    };
  };

  # Config file managed centrally in common.nix
}
