{ pkgs, config, ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
            clock-show-weekday = true;
            color-scheme = "prefer-dark";
      };
    };
  };
}
