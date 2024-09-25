{
  pkgs,
  config,
  ...
}:
{
  services.syncthing = {
    enable = true;
    user = "dk";
  };
}
