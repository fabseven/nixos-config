
{
  description = "Ghetto nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    hosts.url = "github:StevenBlack/hosts";
		zen-browser.url = "github:0xc000022070/zen-browser-flake";
		rose-pine-hyprcusror.url = "github:ndom91/rose-pine-hyprcursor";
		base16.url = "github:SenchoPens/base16.nix";

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

  outputs = { self, nixpkgs, home-manager, nix-colors, hosts, zen-browser, base16, ... } @ inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs.lib) nixosSystem;
      specialArgs = {
        inherit inputs;
        inherit outputs;
        inherit nix-colors;
        inherit hosts;
				inherit zen-browser;
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
            hosts.nixosModule {
              networking.stevenBlackHosts.enable = true;
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
            hosts.nixosModule {
              networking.stevenBlackHosts.enable = true;
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
						base16.nixosModule
						{ scheme = "${inputs.tt-schemes}/base16/ayu-dark.yaml"; }
            ./system/xps
          ];
        };
        nano = nixosSystem {
          specialArgs = specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.dk = import ./home/nano;
              home-manager.extraSpecialArgs = specialArgs;
            }
            hosts.nixosModule {
              networking.stevenBlackHosts.enable = true;
            }
            ./system/nano
          ];
        };
      };
    };
}
