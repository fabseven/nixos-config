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
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.displayManager.ly.enable = true;

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    google-chrome.enable = true;
    nm-applet.enable = true;
  };

  powerManagement.enable = true;

  services.fwupd.enable = true;

  services.gnome.gnome-keyring.enable = true;

 # Monitor hotswap
 #systemd.user.services.kanshi = {
 #  description = "kanshi daemon";
 #  serviceConfig = {
 #    Type = "Simple";
 #    ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
 #  };
 #};

  # Enable touchpad support
  services.libinput.enable = true;

  # SSH support
  services.openssh.enable = true;

  # Printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

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

  #Nvidia drivers
  #services.xserver.videoDrivers = ["nvidia"];

# hardware.graphics = {
#   enable = true;
# };

# hardware.nvidia = {
#   modesetting.enable = true;
#   powerManagement.enable = false;
#   powerManagement.finegrained = false;
#   open = false;
#   nvidiaSettings = true;
#   package = config.boot.kernelPackages.nvidiaPackages.stable;
#   prime = {
#     intelBusId = "PCI:0:2:0";
#     nvidiaBusId = "PCI:14:0:0";
#   };
# };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
