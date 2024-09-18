{ ... }: {
  users.users = {
    dk = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "nginx" "onepassword" ];
      homeMode = "750"; # for nginx to read assets
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
