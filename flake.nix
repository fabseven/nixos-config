{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-23.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixos-hardware.url = "github:NixOS/nixos-hardware";
	};

	outputs = inputs@{ nixpkgs, nixos-hardware, home-manager, ... }: {
		nixosConfigurations = {
			poopi = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;

							home-manager.users.dk = import ./home.nix;
						}
				];
			};
		};
	};
}
