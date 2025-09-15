{ pkgs, ... }:
{
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "dk";
    };
    cosmic-greeter = {
      enable = true;
    };
  };
  services.desktopManager = {
    cosmic = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    cosmic-idle
    cosmic-edit
    cosmic-comp
    cosmic-store
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-applets
    cosmic-screenshot
  ];
}
