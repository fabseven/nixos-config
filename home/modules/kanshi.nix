{ ... } : {
  services.kanshi = {
    enable = true;
    settings = {
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };
    };
  };
}
