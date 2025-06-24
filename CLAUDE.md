# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal NixOS configuration following a flake-based architecture with Home Manager integration. It manages multiple systems (thinkbook, thinkpad, xps, nano) with GNOME desktop environment.

## System Commands

### Building and Switching Configurations

```bash
# Build and switch to a configuration
sudo nixos-rebuild switch --flake .#{hostname}

# Available hosts: thinkbook, thinkpad, xps, nano
# Examples:
sudo nixos-rebuild switch --flake .#thinkbook
sudo nixos-rebuild switch --flake .#thinkpad
sudo nixos-rebuild switch --flake .#xps
sudo nixos-rebuild switch --flake .#nano
```

### Testing Configurations

```bash
# Test configuration without switching permanently
sudo nixos-rebuild test --flake .#{hostname}

# Build configuration without switching
sudo nixos-rebuild build --flake .#{hostname}
```

### Flake Operations

```bash
# Update flake inputs
nix flake update

# Show flake info
nix flake show

# Check flake for issues
nix flake check
```

## Architecture

### Directory Structure

- `system/` - NixOS system-level configurations
  - `modules/` - Common system modules (boot, desktop, networking, etc.)
  - `{hostname}/` - Host-specific system configurations
- `home/` - Home Manager user configurations
  - `modules/` - Home Manager modules for applications
  - `{hostname}/` - Host-specific home configurations
- `dotfiles/` - Raw configuration files for applications
- `pkgs/` - Custom package definitions
- `scripts/` - Utility scripts

### Module System

The configuration uses a modular approach:
- System modules in `system/modules/` handle system-wide settings
- Home Manager modules in `home/modules/` manage user applications
- Host-specific configurations import and configure these modules
- All systems use consistent GNOME desktop configuration

### Desktop Environment Support

The flake defines GNOME desktop environment for all hosts:
- All hosts use GNOME desktop environment by default
- Desktop environment is configured through the system modules

### Key Dependencies

- Home Manager for user-space configuration management
- Stylix for consistent theming across applications
- Various flake inputs for specialized functionality (zen-browser, rose-pine-hyprcursor, etc.)

## Development Workflow

1. Make configuration changes in appropriate modules
2. Test with `nixos-rebuild test --flake .#{hostname}`
3. Apply permanently with `nixos-rebuild switch --flake .#{hostname}`
4. Validate changes with `nix flake check` before applying