
{
  description = "Yoinked nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    hosts.url = "github:StevenBlack/hosts";

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
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nix-colors, hosts, ... }@inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs.lib) nixosSystem;
      specialArgs = {
        inherit inputs;
        inherit outputs;
        inherit nix-colors;
        inherit hosts;
      };
    in {
      nixosConfigurations = {
        rb = nixosSystem {
          specialArgs = specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.dk = import ./home/rb;
              home-manager.extraSpecialArgs = specialArgs;
            }
            ./system/rb
          ];
        };
        thinkpad = nixosSystem {
          specialArgs = specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.dk = import ./home/thinkpad;
              home-manager.extraSpecialArgs = specialArgs;
            }
            ./system/thinkpad
          ];
        };
        xps = nixosSystem {
          specialArgs = specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.dk = import ./home/xps;
              home-manager.extraSpecialArgs = specialArgs;
            }
            hosts.nixosModule {
              networking.stevenBlackHosts.enable = true;
            }
            ./system/xps
          ];
        };
        t14s = nixosSystem {
          specialArgs = specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.dk = import ./home/t14s;
              home-manager.extraSpecialArgs = specialArgs;
            }
            hosts.nixosModule {
              networking.stevenBlackHosts.enable = true;
            }
            ./system/t14s
          ];
        };
      };
    };
}
