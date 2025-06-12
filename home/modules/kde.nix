{ pkgs, config, lib, ... }:
let
  # KDE-specific screenshot tool
  kde-screenshot = pkgs.writeShellScriptBin "kde-screenshot" "${pkgs.kdePackages.spectacle}/bin/spectacle --region --copy-image";
in
{
  # KDE-specific home packages
  home.packages = with pkgs; [
    # Development tools for KDE
    kdePackages.kdevelop
    kdePackages.umbrello
    
    # Media and graphics
    kdePackages.krita
    kdePackages.kdenlive
    kdePackages.kamoso
    kdePackages.elisa
    
    # Internet and communication
    kdePackages.konversation
    kdePackages.akregator
    
    # Utilities
    kdePackages.kfind
    kdePackages.ksystemlog
    kdePackages.ktimer
    kdePackages.kcharselect
    kdePackages.kruler
    kdePackages.kmag
    
    # Screenshot tool wrapper
    kde-screenshot
  ];

  # KDE Connect configuration
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  # Configure KDE applications via XDG config
  xdg.configFile = {
    # Konsole configuration
    "konsolerc" = {
      text = ''
        [Desktop Entry]
        DefaultProfile=Main.profile

        [Favorite Profiles]
        Favorites=

        [MainWindow]
        MenuBar=Disabled
        ToolBarsMovable=Disabled

        [UiSettings]
        ColorScheme=
      '';
    };

    # Dolphin configuration
    "dolphinrc" = {
      text = ''
        [General]
        RememberOpenedTabs=false

        [MainWindow]
        MenuBar=Disabled
        ToolBarsMovable=Disabled

        [PreviewSettings]
        Plugins=directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,svgthumbnail

        [VersionControl]
        enabledPlugins=Git
      '';
    };

    # Kate configuration
    "katerc" = {
      text = ''
        [General]
        Recent Files=
        Save Meta Infos=true
        Show Full Path in Title=true
        Show Menu Bar=false
        Show Status Bar=true
        Show Tab Bar=true

        [MainWindow]
        ToolBarsMovable=Disabled
      '';
    };

    # KDE Plasma shortcuts
    "kglobalshortcutsrc" = {
      text = ''
        [ksmserver]
        Lock Session=Screensaver,Ctrl+Alt+L,Lock Session

        [plasmashell]
        activate task manager entry 1=Meta+1,Meta+1,Activate Task Manager Entry 1
        activate task manager entry 2=Meta+2,Meta+2,Activate Task Manager Entry 2
        activate task manager entry 3=Meta+3,Meta+3,Activate Task Manager Entry 3
        activate task manager entry 4=Meta+4,Meta+4,Activate Task Manager Entry 4
        activate task manager entry 5=Meta+5,Meta+5,Activate Task Manager Entry 5
        activate task manager entry 6=Meta+6,Meta+6,Activate Task Manager Entry 6

        [kwin]
        Quick Tile Window to the Left=Meta+Left,Meta+Left,Quick Tile Window to the Left
        Quick Tile Window to the Right=Meta+Right,Meta+Right,Quick Tile Window to the Right
        Switch to Desktop 1=Meta+1,Ctrl+F1,Switch to Desktop 1
        Switch to Desktop 2=Meta+2,Ctrl+F2,Switch to Desktop 2
        Switch to Desktop 3=Meta+3,Ctrl+F3,Switch to Desktop 3
        Switch to Desktop 4=Meta+4,Ctrl+F4,Switch to Desktop 4
        Switch to Desktop 5=Meta+5,Ctrl+F5,Switch to Desktop 5
        Switch to Desktop 6=Meta+6,Ctrl+F6,Switch to Desktop 6
        Window Close=Meta+W,Alt+F4,Close Window

        [org.kde.spectacle.desktop]
        RectangularRegionScreenShot=Shift+Meta+S,Meta+Shift+Print,Capture Rectangular Region
        WindowUnderCursorScreenShot=Meta+Print,Meta+Print,Capture Window Under Cursor
        _launch=Print,Print,Launch Spectacle
      '';
    };
  };

  # Configure KDE-specific applications
  programs = {
    # Configure Konsole profiles
    konsole = {
      enable = true;
      defaultProfile = "Main";
      profiles = {
        Main = {
          name = "Main";
          colorScheme = "Breeze";
          font = {
            name = "JetBrains Mono";
            size = 11;
          };
          command = "${pkgs.zsh}/bin/zsh";
          environment = {
            "TERM" = "konsole-256color";
          };
        };
      };
    };
  };

  # KDE theming through Home Manager
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
  };

  # GTK theming for KDE
  gtk = {
    enable = true;
    theme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "breeze";
      package = pkgs.kdePackages.breeze-icons;
    };
  };
}