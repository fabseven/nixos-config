# AGENTS.md - NixOS Configuration Repository Guide

## Build/Test Commands

```bash
# Apply config to current host (uses --impure to read environment)
make nixos
# Equivalent: sudo nixos-rebuild switch --flake . --impure

# Test config on a specific host without permanently switching
sudo nixos-rebuild test --flake .#thinkbook   # hosts: thinkbook, thinkpad, xps, nano
sudo nixos-rebuild test --flake .#xps

# Build a specific host without activating (dry run, no store path)
nix build ".#nixosConfigurations.thinkbook.config.system.build.toplevel" --no-link

# Run the full test suite (flake check + build all 4 hosts)
bash test-configs.sh

# Validate flake syntax and dependency graph
nix flake check

# Format all Nix files (uses nixfmt-rfc-style / RFC 166)
make fmt
# Equivalent: nix fmt ./

# Update all flake inputs
make update
# Equivalent: sudo nix flake update

# Garbage collect generations older than 5 days
make gc
```

**There is no CI/CD.** All validation is done locally. Always run `nix flake check` before
committing, and use `test-configs.sh` before changes that touch shared modules.

## Architecture Overview

```
nixos-config/
├── flake.nix             # 13 inputs; outputs: 4 nixosConfigurations (x86_64-linux)
├── Makefile              # Shortcuts: nixos, fmt, update, gc, macos (stub)
├── test-configs.sh       # Bash test suite: flake check + build all hosts
├── pkgs/default.nix      # Custom packages stub (currently empty)
├── scripts/              # Shell scripts symlinked into ~/.local/bin
├── dotfiles/             # Raw config files, symlinked via xdg.configFile
│   ├── hypr/             # Hyprland, hypridle, hyprlock, hyprpaper configs
│   ├── nvim/             # Neovim config
│   ├── waybar-hl/        # Waybar config for Hyprland
│   └── ...               # alacritty, ghostty, helix, kanshi, p10k, wlogout
├── system/
│   ├── modules/          # 22 shared system-wide NixOS modules
│   ├── thinkbook/        # hostname: kimchi  (Lenovo ThinkBook)
│   ├── thinkpad/         # hostname: thinkpad (uses KDE Plasma 6)
│   ├── xps/              # hostname: cake    (Dell XPS 15", NVIDIA PRIME)
│   └── nano/             # hostname: melon   (ThinkPad X1 Nano G2)
└── home/
    ├── common.nix         # Imports all shared home modules
    ├── modules/           # 21 shared Home Manager modules
    ├── thinkbook/         # Host-specific home config
    ├── thinkpad/
    ├── xps/
    └── nano/
```

**Key flake inputs:** `nixpkgs` (nixos-unstable), `home-manager`, `stylix`, `hyprland` (from
flake, not nixpkgs), `waybar` (from flake), `zen-browser`, `nix-ld`, `hosts` (StevenBlack),
`base16`/`nix-colors`, `rose-pine-hyprcursor`.

**Single user:** `dk` across all hosts. All hosts use Home Manager with
`useGlobalPkgs = true` and `useUserPackages = true`.

## Code Style Guidelines

### Function Arguments

Simple modules: single-line pattern:
```nix
{ pkgs, lib, ... }:
{
  # body
}
```

Modules with 3+ arguments: multi-line pattern:
```nix
{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  # body
}
```

### Indentation & Formatting

- **2-space indentation** throughout all `.nix` files
- Use `nix fmt` (`nixfmt-rfc-style`) to auto-format before committing — it is the authoritative formatter
- Opening `{` stays on the same line as the expression it belongs to (except the module body)
- Attribute sets are aligned by the formatter; do not hand-align

### Package Lists

Use `with pkgs;` for all package lists:
```nix
environment.systemPackages = with pkgs; [
  firefox
  git
  neovim
];
```

### Attribute Grouping

Group related sub-options into a set rather than repeating dotted paths:
```nix
# Preferred
services = {
  fwupd.enable = true;
  tailscale.enable = true;
};

# Acceptable for single options or when a comment is needed per-line
services.tlp.enable = lib.mkDefault true;
```

### Multi-line Strings

Use Nix indented strings (`''...''`) for shell scripts, CSS, and embedded configs. Add a
language hint comment before the string for editor syntax highlighting:
```nix
style = # css
  ''
    window#waybar > box { opacity: 0.9; }
  '';

initExtra = # bash
  ''
    stty -ixon
  '';
```

### `let...in` Expressions

Use for deduplication and readability; keep bindings minimal:
```nix
let
  spotify = "${pkgs.playerctl}/bin/playerctl -p spotify";
in
lib.mkAfter {
  "XF86AudioPlay" = "exec '${spotify} play-pause'";
}
```

## Module Patterns

### Simple module (most common)

No `options`/`config` split — just expose configuration directly:
```nix
{ pkgs, ... }:
{
  services.foo.enable = true;
  environment.systemPackages = with pkgs; [ bar ];
}
```

### Full NixOS module with options (only when a toggle is needed)

Use this pattern only when other modules need to conditionally enable this module:
```nix
{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.myapp;
in
{
  options.programs.myapp.enable = mkEnableOption "myapp";
  config = mkIf cfg.enable {
    # ...
  };
}
```

### Host-specific overrides

Host configs append/override shared module config using `lib.mk*` priority helpers:
```nix
# home/thinkbook/sway.nix — extends home/modules/sway.nix
wayland.windowManager.sway.config.keybindings = lib.mkAfter {
  "XF86MonBrightnessDown" = "exec 'light -U 10'";
};
```

| Helper | Purpose |
|---|---|
| `lib.mkDefault` | Low-priority default, easily overridden by host |
| `lib.mkForce` | Override shared module value unconditionally |
| `lib.mkAfter` | Append to lists/attrsets defined in shared modules |
| `lib.mkMerge` | Merge multiple config blocks into one |
| `lib.mkIf` | Conditional config block (requires `options` declaration) |

### Dotfile symlinking

Raw dotfiles live in `dotfiles/` and are linked via Home Manager. Prefer this over writing
full Nix configs for complex third-party apps:
```nix
xdg.configFile."hypr".source = ../../dotfiles/hypr;
```

For mutable paths that change outside the Nix store:
```nix
home.file.".local/bin".source =
  config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/nixos-config/scripts";
```

### Inline script derivation

For one-off shell scripts exposed as packages:
```nix
let
  my-script = pkgs.writeShellScriptBin "my-script" ''
    exec "$@"
  '';
in
{ environment.systemPackages = [ my-script ]; }
```

### Flake input packages

When a package is sourced from a flake input rather than nixpkgs:
```nix
package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
```

## Naming Conventions

| Thing | Convention | Example |
|---|---|---|
| Files and directories | kebab-case | `waybar-hl.nix`, `offload-prime.nix` |
| Module entry points | always `default.nix` | `system/thinkbook/default.nix` |
| Hardware configs | always `hardware.nix` | `system/xps/hardware.nix` |
| Nix attribute names | camelCase | `useGlobalPkgs`, `enableZshIntegration` |
| Tool-native config keys | follow the tool | `kb_options` (Hyprland), `format-icons` (waybar) |
| Environment variable keys | SCREAMING_SNAKE_CASE | `CPU_BOOST_ON_AC` |
| Flake host attributes | machine shortname | `thinkbook`, `xps` |
| Actual hostnames | friendly name | `kimchi`, `cake`, `melon` |

## Adding New Modules

1. **System module:** create `system/modules/my-feature.nix`, import it from the relevant
   host `default.nix` (or `system/modules/common.nix` if it should apply everywhere).
2. **Home module:** create `home/modules/my-feature.nix`, import it from `home/common.nix`
   (shared) or from a host-specific `home/{host}/default.nix`.
3. **New flake input:** add to `flake.nix` inputs, follow the `follows = "nixpkgs"` pattern
   for inputs that should track the same nixpkgs. Prefer nixpkgs packages over new inputs.
4. **Custom package:** add to `pkgs/default.nix` as a function `pkgs: { name = ...; }`.
5. After any structural change, run `nix flake check` then `bash test-configs.sh`.

## Git Workflow

- Default branch: `master`
- Rebase workflow (`git pull --rebase`); `autoSetupRemote = true` in git config
- Run `make fmt` before committing to keep formatting consistent
- `CLAUDE.md` is gitignored (local-only AI notes); `AGENTS.md` is tracked
