{ ... }:
let enable = true; # save energy until we need it
in {
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
  services.blueman.enable = enable;
}
