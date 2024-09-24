# NixOS workstation Kanshi config
{
  config,
  pkgs,
  ...
}: {
  services.kanshi.enable = true;
  xdg.configFile = {
    "kanshi/config" = {
      enable = true;
      source = ../../Kanshi/config;
    };
  };
}
