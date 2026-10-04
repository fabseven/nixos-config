{ ... }:
{
  users.users = {
    dk = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "nginx"
        "onepassword"
        "audio"
        "vboxusers"
        "networkmanager"
        "lpadmin"
      ];
      homeMode = "750"; # for nginx to read assets
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBUcEc6vRCPnjUw1BGpZjxmx0R0iuaJllORb4A2gpVzy" # 1Password
      ];
    };
  };

  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraConfig = ''
      Defaults        timestamp_timeout=600
    '';
  };
}
