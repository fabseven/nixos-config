{ outputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs = {};

  imports = [
    ./boot.nix
    ./coding.nix
    ./fonts.nix
    ./linux.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./python.nix
    ./shell.nix
    ./sound.nix
    ./stylix.nix
    ./sway.nix
    ./users.nix
  ];

  services.dbus.enable = true;
}
