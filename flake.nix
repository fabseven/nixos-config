{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    omarchy-nix = {
        url = "github:henrysipp/omarchy-nix";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, omarchy-nix, home-manager, ... }: {
    nixosConfigurations.piss = nixpkgs.lib.nixosSystem {
      modules = [
        ./machines/t14/default.nix
        omarchy-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          programs.waybar.settings.mainBar.position = "bottom";
          omarchy = {
            full_name = "fabseven";
            email_address = "fabbycrafted@gmail.com";
            theme = "tokyo-night";
          };
          home-manager = {
            users.dk = {
              home.stateVersion = "25.11";
              imports = [ omarchy-nix.homeManagerModules.default ];
            };
          };
        }
      ];
    };
  };
}
