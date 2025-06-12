{ ... }: {
  nixpkgs.config.allowUnfree = true;

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
    ./sound.nix
    ./stylix.nix
    ./users.nix
    ./gnome.nix
    ./distrobox.nix
  ];

  services.dbus.enable = true;
}
