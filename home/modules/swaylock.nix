{ config, lib, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = lib.mkDefault "111111";
      image = lib.mkForce "../wallpaper.jpg";
      ignore-empty-password = true;
      indicator-radius = "100";
      indicator-thickness = "10";
      inside-clear-color = lib.mkDefault "222222";
      inside-color = lib.mkDefault "1d2021";
      inside-ver-color = lib.mkDefault "ff99441c";
      inside-wrong-color = lib.mkDefault "ffffff1c";
      key-hl-color = lib.mkDefault "ffffff80";
      line-clear-color = lib.mkDefault "00000000";
      line-color = lib.mkDefault "00000000";
      line-ver-color = lib.mkDefault "00000000";
      line-wrong-color = lib.mkDefault "00000000";
      ring-clear-color = lib.mkDefault "ff994430";
      ring-color = lib.mkDefault "282828";
      ring-ver-color = lib.mkDefault "ffffff00";
      ring-wrong-color = lib.mkDefault "ffffff55";
      separator-color = lib.mkDefault "22222260";
      text-caps-lock-color = lib.mkDefault "00000000";
      text-clear-color = lib.mkDefault "222222";
      text-ver-color = lib.mkDefault "00000000";
      text-wrong-color = lib.mkDefault "00000000";
    };
  };
}
