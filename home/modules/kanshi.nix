# NixOS workstation Kanshi config
{
  config,
  ...
}: {
  services.kanshi.enable = true;

  home.file.".config/kanshi".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/dotfiles/kanshi";
}
