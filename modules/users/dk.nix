{ ... }: {
  users.users = {
    dk = {
      isNormalUser = true;
      extraGroups = [
        "audio"
        "input"
        "networkmanager"
        "sound"
        "tty"
        "wheel"
        "docker"
      ];
    };
  };
}
