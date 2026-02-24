# Dell XPS 15"
{ ... }:
{
  imports = [
    ../common.nix
    ../modules/kanshi.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
