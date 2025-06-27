{ config, pkgs, lib, ... }: {
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
} 
