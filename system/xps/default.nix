{ pkgs, inputs, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [ powertop libinput acpi ];

  networking = {
    hostName = "cake";
    firewall.allowedTCPPorts = [ 22 80 443 ];
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nm-applet.enable = true;
  programs._1password.enable = true;
  programs._1password-gui.enable = true;

  powerManagement.enable = true;

  services.fwupd.enable = true;

  services.gnome.gnome-keyring.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

	# Steam
	programs.steam.enable = true;

  # Display backlight
  programs.light.enable = true;
  hardware.sensor.iio.enable = true;

  # fingerprint sensor
	security.pam.services.login.fprintAuth = true;
	services.fprintd = {
		enable = true;
		tod = {
			enable = true;
			driver = pkgs.libfprint-2-tod1-goodix;
		};
	};

  #Nvidia drivers
  hardware.opengl = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:14:0:0";
    };
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
