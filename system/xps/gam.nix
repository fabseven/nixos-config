{ config, pkgs, ... }:

let
  gam = pkgs.callPackage (
    { lib, fetchFromGitHub, python3 }:
    import ./gam.nix { inherit lib fetchFromGitHub python3; }
  ) {};
in
{
  environment.systemPackages = [ gam ];
}