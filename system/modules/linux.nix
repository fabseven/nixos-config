{
  pkgs,
  inputs,
  options,
  ...
}:
{

  imports = [
    inputs.nix-ld.nixosModules.nix-ld
  ];

  environment.systemPackages = with pkgs; [
    fzf
    fd
    jq
    bat
    httpie
    libglibutil
    mosh
    dust
    psmisc # fuser
    lsof
    bind
    gparted
    dmidecode
    unixtools.xxd
    iprange
    ps_mem
  ];

  programs.nix-ld = {
    enable = true;
    dev.enable = false;
    libraries =
      options.programs.nix-ld.libraries.default
      ++ (with pkgs; [
        glib
      ]);
  };

  # enable zsh completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  services.logind = {
    powerKey = "suspend";
    lidSwitch = "suspend";
  };

  # automount removable media
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # OpenSSH integration
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };
}
