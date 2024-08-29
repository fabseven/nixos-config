
{
  description = "Yoinked nixo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs-master.url = "github:NixOS/nixpkgs/master";

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

  outputs = { self, nixpkgs, home-manager, nix-colors, ... }@inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs.lib) nixosSystem;
      specialArgs = { inherit inputs outputs nix-colors; };

    in {
      nixosConfigurations = {
        rb = nixosSystem {
          specialArgs = specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.billy = import ./home/rb;
              home-manager.extraSpecialArgs = specialArgs;
            }
            ./system/rb
          ];
        };
      };
    };
}
