{ ... } : {
  services.kanshi = {
    enable = true;
    profiles = {
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = "1";
            status = "enable";
          }
        ];
      };
    };
  };
}
