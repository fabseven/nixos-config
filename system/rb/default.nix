{ pkgs, inputs, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [ powertop libinput acpi ];

  networking = {
    hostName = "rb";
    firewall.allowedTCPPorts = [ 22 80 443 ];
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
