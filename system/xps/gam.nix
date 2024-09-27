{ config, pkgs, ... }:

let
  gam = pkgs.callPackage ../modules/gam.nix {};
in
{
  environment.systemPackages = with pkgs; [
    gam
  ];
  environment.variables = {
    GAMUSERCONFIGDIR = "$XDG_CONFIG_HOME/gam";
    GAMSITECONFIGDIR = "$XDG_CONFIG_HOME/gam";
    GAMCACHEDIR = "$XDG_CACHE_HOME/gam";
  };
}