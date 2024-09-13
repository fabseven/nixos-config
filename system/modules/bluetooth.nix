{ ... }:
let enable = true; # save energy until we need it
in {
  hardware.bluetooth.enable = enable;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = enable;
}
