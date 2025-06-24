# Personal NixOS Configuration

A well-structured NixOS configuration following best practices for managing multiple systems and home environments.

## Directory Structure

```
├── dotfiles/          # Application-specific configurations
├── home/              # Home Manager configurations
│   ├── common.nix     # Shared home configuration
│   ├── modules/       # Home Manager modules
│   └── {host}/        # Host-specific home configurations
├── system/            # NixOS system configurations
│   ├── modules/       # System modules
│   └── {host}/        # Host-specific system configurations
├── lib/               # Custom library functions
├── pkgs/              # Custom packages
├── scripts/           # Utility scripts
└── flake.nix          # Main flake configuration
```

## Hosts

- **thinkbook** - Lenovo ThinkPad (kimchi)
- **thinkpad** - ThinkPad
- **xps** - Dell XPS
- **nano** - Lenovo ThinkPad X1 Nano G2

## Features

- **Flake-based configuration** with proper structure
- **Home Manager integration** for user-space configuration
- **Modular design** with reusable components
- **Centralized dotfiles management**
- **GNOME desktop environment** with consistent configuration
- **Alternative window managers** available (Sway, Hyprland) via dotfiles
- **Consistent theming** with Stylix
- **Power management** with TLP
- **Development tools** and environments

## Desktop Environment Support

This configuration uses GNOME as the primary desktop environment across all hosts:

### Available Configurations

- `thinkbook` - ThinkPad with GNOME
- `thinkpad` - ThinkPad with GNOME
- `xps` - Dell XPS with GNOME  
- `nano` - Nano with GNOME

### Building Configurations

To build and switch to any system:

```bash
# Build and switch to a configuration
sudo nixos-rebuild switch --flake .#{hostname}

# Examples:
sudo nixos-rebuild switch --flake .#thinkbook
sudo nixos-rebuild switch --flake .#thinkpad
sudo nixos-rebuild switch --flake .#xps
sudo nixos-rebuild switch --flake .#nano
```

### Desktop Features

**GNOME Configuration:**
- Custom GNOME extensions (Space Bar, Tactile, Blur My Shell, etc.)
- Custom keybindings and shortcuts
- Optimized settings for productivity
- Consistent theming with Stylix

## Quick Start

1. Clone this repository
2. Update hardware configurations for your systems in `system/{hostname}/hardware.nix`
3. Build and switch to your configuration:
   ```bash
   # Build and switch to your host configuration
   sudo nixos-rebuild switch --flake .#{hostname}
   
   # Test configuration before switching permanently
   sudo nixos-rebuild test --flake .#{hostname}
   ```

## References

- [App options list](https://mynixos.com/)
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)

TODOs:
- [x] Remove bemenu and add rofi instead
- [x] Add helix support
- [x] Monitor setup on work laptop
- [x] Add swaylock with swayidle support
- [x] Add Ly login manager
- [x] Better notifications
    - [x] Mako is good enough
- [x] Accel speed off of pointers
- [x] Add 1Password proper support with unlockable web extension through tray
- [x] Vbox setup, user in vboxusers group
- [x] Add T14s to systems list
- [x] Kanshi setup
    - [x] Add laptop setup
    - [x] Add work setup
- [x] Printing support - https://github.com/Qeatrix/nixos-config
- [x] Garbage collector for old versions
- [x] Gnome stuff
    - [x] Extensions
        - [x] Blur my shell
        - [x] Notification Banner Position
        - [x] Space Bar
        - [x] Tactile
        - [x] Undecorate Window
        - [x] Caffeine
    - [ ] Hotkeys
        - [ ] Proper Super + 1,2,3,4,5 keys for Space Bar & Workspaces
        - [ ] Launcher keybinds (ULauncher or similar)
- [ ] Firefox setup - https://github.com/Qeatrix/nixos-config
- [x] Powershell scripting
- [x] OpenVPN setup
- [ ] Applications
    - [x] Discord
    - [x] Telegram
    - [x] Syncthing
    - [x] Zed editor - https://github.com/NixOS/nixpkgs/issues/309662#issuecomment-2234031488
    - [x] Bottles-unwrapped for gaming
    - [x] Thunar
    - [x] Ranger
    - [x] Tailscale
    - [x] Ticktick
    - [x] Zoom
    - [x] GAM - Only doable via distrobox
    - [ ] Workspace One hub - might need to create one
