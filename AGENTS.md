# AGENTS.md - NixOS Configuration Repository Guide

## Build/Test Commands
- `make nixos` - Build and switch NixOS configuration (uses `sudo nixos-rebuild switch --flake . --impure`)
- `sudo nixos-rebuild test --flake .#{hostname}` - Test configuration without permanent switch (hosts: thinkbook, thinkpad, xps, nano)
- `nix flake check` - Validate flake configuration for syntax and dependency issues
- `make fmt` - Format all Nix files using `nix fmt ./`
- `make update` - Update flake inputs with `sudo nix flake update`

## Code Style Guidelines
- **Imports**: Use relative imports, organize by system/home modules, follow existing import order
- **Formatting**: Use 2-space indentation, align attributes vertically, use `nix fmt` for consistent formatting
- **Naming**: Use kebab-case for files/modules, camelCase for Nix attributes, descriptive hostnames
- **Structure**: Keep system config in `system/`, user config in `home/`, external dotfiles in `dotfiles/`
- **Modules**: Create reusable modules, use `lib.mkIf` for conditional configs, follow enable/package pattern
- **Comments**: Add inline comments for complex configurations, document host-specific requirements
- **Dependencies**: Always check existing modules before adding new inputs, prefer nixpkgs packages
- **Git**: Default branch is `master`, use rebase workflow, auto-setup remotes enabled

## Architecture Notes
- Flake-based configuration with Home Manager integration
- Modular system: `system/modules/` for system-wide, `home/modules/` for user applications
- Host-specific configs in respective directories (thinkbook, thinkpad, xps, nano)
- All systems use Hyprland desktop environment with consistent theming via Stylix