{ pkgs, inputs, config, ... }: {
  imports = [
    ../modules/common.nix
    ../modules/bluetooth.nix
    ./hardware.nix
/* 		./offload-prime.nix */
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

  networking = {
    hostName = "cake";
    firewall.allowedTCPPorts = [ 22 80 443 ];
    stevenBlackHosts = {
      blockFakenews = true;
      blockGambling = true;
      blockPorn = true;
      blockSocial = false;
    };
  };

  hardware.pulseaudio.enable = false;

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    nm-applet.enable = true;
		gamemode.enable = true;
		steam = {
			enable = true;
			gamescopeSession.enable = true;
		};
  };

  powerManagement.enable = true;

  services.fwupd.enable = true;

  services.gnome.gnome-keyring.enable = true;
	services.tailscale.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

	# Blueman applet
/*   services.blueman.enable = true; */

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

  # fingerprint sensor
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

  #Nvidia drivers
  #https://nixos.wiki/wiki/Nvidia - check the local settings to set with steam to use nvidia
/*   services.xserver.videoDrivers = ["nvidia"]; */

  hardware = {
		nvidia = {
			modesetting.enable = true;
			powerManagement.enable = false;
			powerManagement.finegrained = false;
			open = false;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.production;
			/* prime = {
				offload = {
					enable = true;
					enableOffloadCmd = true;
				};
				#amdgpuBusId = "PCI:0:6:0";
				intelBusId = "PCI:0:2:0";
				nvidiaBusId = "PCI:1:0:0";
			}; */
		};
	}; 

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
