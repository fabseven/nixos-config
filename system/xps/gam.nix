{ config, pkgs, ... }:

let
  gam = import ./gam.nix {
    inherit (pkgs) lib fetchFromGitHub python3;
  };
in
{
  environment.systemPackages = [ gam ];
}