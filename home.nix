{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dk";
  home.homeDirectory = "/home/dk";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
	  # Utils
	  ripgrep
	  jq
	  eza
	  fzf
	  rustdesk
	  tmux
	  neovim
	  kitty-themes
	  nerdfonts
	  meslo-lgs-nf
	  blueman
	  noto-fonts-color-emoji
	  oh-my-zsh
	  zip
	  zsh-powerlevel10k

	  # Stuff from old Debian
	  rofi
	  dmenu
	  flameshot
	  feh
	  autorandr
	  imagemagick
	  ranger
	  mpv
	  dunst
	  picom

	  # Networking tools
	  mtr
	  iperf3
	  dnsutils
	  ldns
	  aria2
	  socat
	  nmap
	  ipcalc

	  # Misc
	  file
	  which
	  tree
	  gnused
	  gnutar
	  gawk
	  zstd
	  gnupg
	  btop
	  neofetch
	  
	  # Nix related
	  nix-output-monitor

	  # System call monitoring
	  strace
	  ltrace
	  lsof

	  # System tools
	  sysstat
	  ethtool
	  pciutils
	  usbutils
	  polkit
	  xclip
	  
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Sway configuration
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
        {command = "kitty";}
      ];
    };
  };

  # Program specific configurations

  programs.git = {
    enable = true;
    userName = "Fabby";
    userEmail = "fabbycrafted@gmail.com";
  };

  programs.zsh = {
   enable = true;
   autocd = true;
   plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./config;
      file = "p10k.zsh";
    }
  ];
};

  home.file.".p10k.zsh".source = ./config/p10k.zsh;

  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      cursor_shape = "block";
    };
    font = {
        name = "JetBrains Mono";
	size = 12;
    };
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
    ];
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
