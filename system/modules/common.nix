{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./boot.nix
    ./coding.nix
    ./shell.nix
    ./fonts.nix
    ./linux.nix
    ./locale.nix
    ./hardening.nix
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
  };

  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "dk" ];
    };
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

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
