{ pkgs, lib, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
  ];

  environment = {
		systemPackages = with pkgs; [ 
				powertop 
				libinput 
				acpi 
				mangohud
		];
		localBinInPath = true;
	};

  networking.hostName = "melon";

  hardware.pulseaudio.enable = false;

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
  };

  services.fwupd.enable = true;
  
	services.tailscale.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

	# TLP Settings and enabling
	services.power-profiles-daemon.enable = false;
	services.tlp.enable = lib.mkDefault true;
	services.tlp.settings = {
		CPU_BOOST_ON_AC = "1";
    CPU_BOOST_ON_BAT = "0";
    CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    CPU_HWP_DYN_BOOST_ON_AC = "1";
    CPU_HWP_DYN_BOOST_ON_BAT = "0";
    CPU_MAX_PERF_ON_AC = "100";
    CPU_MAX_PERF_ON_BAT = "75";
    PLATFORM_PROFILE_ON_AC = "balanced";
    PLATFORM_PROFILE_ON_BAT = "low-power";
    RUNTIME_PM_ON_AC = "auto";
    RUNTIME_PM_ON_BAT = "auto";
    WIFI_PWR_ON_AC = "off";
    WIFI_PWR_ON_BAT = "off";
	};

  # Printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Display backlight
  programs.light.enable = true;
  hardware.sensor.iio.enable = true;

  # Fingerprint sensor
#security.pam.services.login.fprintAuth = true;
#services.fprintd = {
#	enable = true;
#	tod = {
#		enable = true;
#		driver = pkgs.libfprint-2-tod1-goodix;
#	};
#};

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

  hardware = {
		cpu.intel.updateMicrocode = true;
	}; 

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
