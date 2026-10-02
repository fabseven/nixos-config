{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    nh
    nix-search-cli
    nixfmt
    nil
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        # Opinionated: disable global registry
        flake-registry = "";
      };
      # Opinionated: disable channels
      channel.enable = false;

      # make flake registry and nix path match flake inputs
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    };

}
