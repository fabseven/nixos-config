{ config, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      lib.mkForce.color = "111111";
      ignore-empty-password = true;
      indicator-radius = "100";
      indicator-thickness = "10";
      lib.mkForce.inside-clear-color = "222222";
      lib.mkForce.inside-color = "1d2021";
      lib.mkForce.inside-ver-color = "ff99441c";
      lib.mkForce.inside-wrong-color = "ffffff1c";
      lib.mkForce.key-hl-color = "ffffff80";
      lib.mkForce.line-clear-color = "00000000";
      lib.mkForce.line-color = "00000000";
      lib.mkForce.line-ver-color = "00000000";
      lib.mkForce.line-wrong-color = "00000000";
      lib.mkForce.ring-clear-color = "ff994430";
      lib.mkForce.ring-color = "282828";
      lib.mkForce.ring-ver-color = "ffffff00";
      lib.mkForce.ring-wrong-color = "ffffff55";
      lib.mkForce.separator-color = "22222260";
      lib.mkForce.text-caps-lock-color = "00000000";
      lib.mkForce.text-clear-color = "222222";
      lib.mkForce.text-ver-color = "00000000";
      lib.mkForce.text-wrong-color = "00000000";
    };
  };
}
