{ ... } : {
  services.kanshi = {
    enable = true;
    profiles = {
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };
      work = {
        outputs = [
          {
            criteria = "Samsung Electric Company LS27A800U HNMR601821";
            mode = "2560x1440@60Hz";
            position = "0,626";
            scale = 1.0;
          }
          {
            criteria = "Samsung Electric Company LS27A800U HNMR601813";
            mode = "2560x1440@60Hz";
            position = "2560,0";
						transform = "90";
            scale = 1.0;
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
        extraConfig = ''
          exec swaymsg cock
        '';
      };
    };
  };
}
