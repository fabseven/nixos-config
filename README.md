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
