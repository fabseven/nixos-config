# NixOS workstation Kanshi config
{ ... }:
{
  services.kanshi.enable = true;

  xdg.configFile."kanshi".source = ../../dotfiles/kanshi;
}
