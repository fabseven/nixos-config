{ ... }: {

  hardware.bluetooth = {
    enable = enable;
    powerOnBoot = true;
    hsphfpd.enable = false;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

}
