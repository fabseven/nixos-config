{
  pkgs,
  config,
  ...
}:
{
  services.syncthing = {
    enable = true;
    user = "dk";
    dataDir = "/home/dk/Syncthing";
    configDir = "/home/dk/Syncthing/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings.devices = {
      "PC-1" = {id = "T6BERIU-M6YNR65-MNGIANL-5E7HR52-7X6IKKX-IIUULMY-PMJ37M7-53COKQX";};
    };
  };
}
