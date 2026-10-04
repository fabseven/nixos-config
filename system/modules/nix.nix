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

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "libsoup-2.74.3"
    ];
  };

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
        # make nix path match flake inputs
        nix-path = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      };
      # Opinionated: disable channels
      channel.enable = false;

      # make flake registry match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    };

}
