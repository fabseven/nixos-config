{ ... }:
{
  imports = [
    ../modules/bluetooth.nix
    ../modules/common.nix
    ../modules/kde.nix
    ./hardware.nix
  ];

  networking.hostName = "thinkpad";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
