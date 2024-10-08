{ pkgs, inputs, config, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [ 

  ];

  networking = {
    hostName = "slave";
    firewall.allowedTCPPorts = [ 22 80 443 ];
  };

  services.displayManager.ly.enable = true;

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
  };

  services.fwupd.enable = true;

  services.gnome.gnome-keyring.enable = true;
  
  environment.localBinInPath = true;

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
