{ ... }:
{
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ../modules/kde.nix
    ./hardware.nix
  ];

  networking.hostName = "kimchi";

  system.stateVersion = "24.11";
}
