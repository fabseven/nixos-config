{ outputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs = {};

  imports = [
    ./boot.nix
    ./coding.nix
		./shell.nix
		./fonts.nix
    ./linux.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./python.nix
    #./gam.nix
    ./sound.nix
    ./stylix.nix
    ./sway.nix
    ./users.nix
    ./gnome.nix
		./distrobox.nix
  ];

  services.dbus.enable = true;
}
