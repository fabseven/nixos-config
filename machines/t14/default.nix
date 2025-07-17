{ ... }: {
  imports = [
    ../../modules/users/dk.nix
    ./configuration.nix
    ./hardware.nix
  ];

  home-manager.useGlobalPkgs = true;
  services.fwupd.enable = true;
  networking.hostName = "piss";
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "prohibit-password";
    };
  };
  system.stateVersion = "25.11";
  security.polkit.enable = true;
}
