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
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      };
      # Opinionated: disable channels
      channel.enable = false;

      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    };

}
