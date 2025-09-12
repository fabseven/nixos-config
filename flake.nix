{
  description = "Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    
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
    base16.url = "github:SenchoPens/base16.nix";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";

    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      specialArgs = {
        inherit inputs;
        inherit (inputs) nix-colors hosts zen-browser;
      };
    in {
      nixosConfigurations = {
        thinkbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            ./system/thinkbook/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.dk = import ./home/thinkbook;
                extraSpecialArgs = specialArgs;
              };
            }
            inputs.hosts.nixosModule
            { networking.stevenBlackHosts.enable = true; }
          ];
        };

        thinkpad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            ./system/thinkpad/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.dk = import ./home/thinkpad;
                extraSpecialArgs = specialArgs;
              };
            }
            inputs.hosts.nixosModule
            { networking.stevenBlackHosts.enable = true; }
          ];
        };
        
        xps = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            ./system/xps/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.dk = import ./home/xps;
                extraSpecialArgs = specialArgs;
              };
            }
            inputs.hosts.nixosModule
            { networking.stevenBlackHosts.enable = true; }
            inputs.base16.nixosModule
            { scheme = "${inputs.tt-schemes}/base16/ayu-dark.yaml"; }
          ];
        };
        
        nano = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            ./system/nano/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.dk = import ./home/nano;
                extraSpecialArgs = specialArgs;
              };
            }
            inputs.hosts.nixosModule
            { networking.stevenBlackHosts.enable = true; }
          ];
        };
      };
    };
}
