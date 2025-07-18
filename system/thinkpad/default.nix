{ pkgs, lib, ... }: {
  imports = [
    ../modules/bluetooth.nix
    ../modules/common.nix
    ./hardware.nix
  ];

  networking.hostName = "thinkpad";

  environment = {
    systemPackages = with pkgs; [ 
      powertop 
      libinput 
      acpi 
      mangohud
    ];
    localBinInPath = true;
  };

  services.pulseaudio.enable = false;

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    light.enable = true;
  };

  services = {
    fwupd.enable = true;
    tailscale.enable = true;
    libinput.enable = true;
    
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    power-profiles-daemon.enable = false;
    tlp = {
      enable = lib.mkDefault true;
      settings = {
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
    };
  };

  hardware.sensor.iio.enable = true;

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

  system.stateVersion = "25.11";
}
