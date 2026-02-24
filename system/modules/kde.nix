{ pkgs, lib, ... }:
{

  # Essential KDE packages
  environment.systemPackages = with pkgs; [
    # Core KDE desktop
    kdePackages.plasma-desktop
    kdePackages.plasma-workspace
    kdePackages.plasma-workspace-wallpapers
    kdePackages.plasma-integration

    # KDE applications
    kdePackages.kate
    kdePackages.konsole
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.ark
    kdePackages.kcalc
    kdePackages.systemsettings
    kdePackages.spectacle
    kdePackages.kdeconnect-kde
    kdePackages.kde-gtk-config

    # Additional utilities
    glib
    gsettings-desktop-schemas
    xdg-utils
  ];

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Enable KDE Plasma 6
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";

  # KDE-specific services (only if not conflicting)
  services.power-profiles-daemon.enable = lib.mkDefault true;
  services.upower.enable = lib.mkDefault true;
  services.udisks2.enable = lib.mkDefault true;

  # Polkit integration
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';

  # D-Bus configuration (dbus already enabled in common.nix)
  services.dbus.packages = with pkgs; [
    kdePackages.plasma-workspace
  ];

  # XDG desktop integration
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
    };
  };

  # Environment variables for KDE
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "kde";
    QT_STYLE_OVERRIDE = "breeze";
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_SESSION_DESKTOP = "KDE";
  };

  # Hardware acceleration (using newer graphics API)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Security and permissions
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

}
