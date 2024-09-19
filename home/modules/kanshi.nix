{ ... } : {
  services.kanshi = {
    enable = true;
    profiles = {
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = "1.0";
            status = "enable";
          }
        ];
      };
    };
  };
}
