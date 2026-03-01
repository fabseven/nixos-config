{ ... }:
{
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ../modules/kde.nix
    ./hardware.nix
  ];

  networking.hostName = "melon";

  hardware.cpu.intel.updateMicrocode = true;

  # Fingerprint sensor (disabled — needs libfprint-2-tod1-goodix driver)
  #services.fprintd.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
