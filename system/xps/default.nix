{
  config,
  ...
}:
{
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
    ./offload-prime.nix
  ];

  networking.hostName = "cake";

  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
