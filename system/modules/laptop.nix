# Shared laptop configuration: TLP power management, backlight, sensors
{ lib, ... }:
{
  services.power-profiles-daemon.enable = false;
  services.tlp = {
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

  # Display backlight
  programs.light.enable = true;
  hardware.sensor.iio.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;
}
