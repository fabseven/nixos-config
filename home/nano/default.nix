# Lenovo ThinkPad X1 Nano G2
{ ... }:
{
  imports = [
    ../common.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.11";
}
