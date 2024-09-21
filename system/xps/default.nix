{ pkgs, inputs, config, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [ powertop libinput acpi ];

  networking = {
    hostName = "cake";
    firewall.allowedTCPPorts = [ 22 80 443 ];
    extraHosts = let 
      hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts;
      hostsFile = builtins.fetchurl hostsPath;
    in builtins.readFile "${hostsFile}";
  };

  services.displayManager.ly.enable = true;

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    nm-applet.enable = true;
  };

  powerManagement.enable = true;

  services.fwupd.enable = true;

  services.gnome.gnome-keyring.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

  # Printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

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

  environment.localBinInPath = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  hardware.graphics = {
    enable = true;
  };

  #Nvidia drivers
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
