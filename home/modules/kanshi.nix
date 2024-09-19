{ ... } : {
  services.kanshi = {
    enable = true;
    profiles = {
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = "1.000000";
            status = "enable";
          }
        ];
      };
    };
  };
}
