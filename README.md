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
- **Host-specific desktop environments** (KDE Plasma, Hyprland)
- **Additional desktop options** available as modules (Sway, COSMIC)
- **Consistent theming** with Stylix
- **Power management** with TLP
- **Development tools** and environments

## Desktop Environment Support

Desktop environments are configured per host by importing system modules.

### Available Configurations

- `thinkbook` - Lenovo ThinkBook (base shared modules; no host-specific DE module imported)
- `thinkpad` - ThinkPad with KDE Plasma 6 (`system/modules/kde.nix`)
- `xps` - Dell XPS (base shared modules; no host-specific DE module imported)
- `nano` - ThinkPad X1 Nano with Hyprland (`system/modules/hyprland.nix`)

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

**Desktop Notes:**
- KDE Plasma 6 support is provided by `system/modules/kde.nix`
- Hyprland support is provided by `system/modules/hyprland.nix`
- Additional desktop modules (for example `system/modules/cosmic.nix`) can be imported per host
- Shared theming is provided through Stylix

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
- [x] GNOME desktop setup (legacy)
    - [x] Extensions (legacy GNOME)
        - [x] Blur my shell
        - [x] Notification Banner Position
        - [x] Space Bar
        - [x] Tactile
        - [x] Undecorate Window
        - [x] Caffeine
    - [ ] Hotkeys (legacy GNOME)
        - [ ] Proper Super + 1,2,3,4,5 keys for GNOME Space Bar workspaces
        - [ ] Launcher keybinds (GNOME/ULauncher or similar)
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
