# NixOS workstation Kanshi config
{
  config,
  pkgs,
  ...
}: {
  services.kanshi.enable = true;
  # Config file managed centrally in common.nix
}
