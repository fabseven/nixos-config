{
  description = "Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nix-ld.url = "github:Mic92/nix-ld";
    hosts = {
      url = "github:StevenBlack/hosts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    hyprland.url = "github:hyprwm/Hyprland";
    waybar = {
      url = "github:Alexays/Waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        inherit (inputs) hosts zen-browser;
      };
      mkHost =
        {
          systemConfig,
          homeConfig,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            systemConfig
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.dk = import homeConfig;
                extraSpecialArgs = specialArgs;
              };
            }
            inputs.hosts.nixosModule
          ] ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        thinkbook = mkHost {
          systemConfig = ./system/thinkbook/default.nix;
          homeConfig = ./home/thinkbook;
        };

        thinkpad = mkHost {
          systemConfig = ./system/thinkpad/default.nix;
          homeConfig = ./home/thinkpad;
        };

        xps = mkHost {
          systemConfig = ./system/xps/default.nix;
          homeConfig = ./home/xps;
        };

        nano = mkHost {
          systemConfig = ./system/nano/default.nix;
          homeConfig = ./home/nano;
        };
      };

      # Add formatter for each system
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
      };
    };
}
