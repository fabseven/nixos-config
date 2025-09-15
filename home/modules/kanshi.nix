# NixOS workstation Kanshi config
{
  config,
  ...
}:
{
  services.kanshi.enable = true;

  xdg.configFile."kanshi".source = ../../dotfiles/kanshi;
}
