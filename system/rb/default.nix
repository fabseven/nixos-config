{ pkgs, inputs, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    # ../modules/coolercontrol.nix
  ];

  environment.systemPackages = with pkgs; [ powertop libinput acpi ];

  networking = {
    hostName = "fw";
  };

  programs.nm-applet.enable = true;

  powerManagement.enable = true;

  services.fwupd.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

  # Display backlight
  programs.light.enable = true;
  hardware.sensor.iio.enable = true;

  # fingerprint sensor
  services.fprintd.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
