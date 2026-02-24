{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./boot.nix
    ./coding.nix
    ./shell.nix
    ./fonts.nix
    ./laptop.nix
    ./linux.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./python.nix
    ./sound.nix
    ./stylix.nix
    ./users.nix
    ./distrobox.nix
  ];

  services = {
    dbus.enable = true;
    fwupd.enable = true;
    tailscale.enable = true;
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      powertop
      libinput
      acpi
      mangohud
    ];
    localBinInPath = true;
  };

  virtualisation.virtualbox.host.enable = true;

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
