{ config, pkgs, lib, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma6.enable = true;
    };
    
    # KDE-specific services
    power-profiles-daemon.enable = false; # Conflicts with TLP
    upower.enable = true;
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      # KDE Applications
      kdePackages.kate
      kdePackages.konsole
      kdePackages.dolphin
      kdePackages.okular
      kdePackages.spectacle
      kdePackages.kcalc
      kdePackages.kwrite
      kdePackages.gwenview
      kdePackages.ark
      kdePackages.filelight
      kdePackages.kclock
      kdePackages.kgpg
      kdePackages.krfb
      kdePackages.krdc
      kdePackages.kwalletmanager
      
      # Theming and customization
      kdePackages.plasma-browser-integration
      kdePackages.kgamma
      kdePackages.systemsettings
      
      # Launcher
      ulauncher
    ];
  };

  # KDE-specific configuration
  programs = {
    kdeconnect.enable = true;
    dconf.enable = true; # Needed for some applications
  };

  # Fonts for KDE
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];
}
