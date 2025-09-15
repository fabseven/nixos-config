{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.programs.steam;
in
{
  options.programs.steam.enable = mkEnableOption "steam";

  config = mkIf cfg.enable {
    hardware.opengl = {
      # this fixes the "glXChooseVisual failed" bug, context:
      #https://github.com/NixOS/nixpkgs/issues/47932
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
    };

    # optionally enable 32bit pulseaudio support if pulseaudio is enabled
    services.pulseaudio.support32Bit = config.services.pulseaudio.enable;

    #hardware.graphics.enable32Bit = config.hardware.graphics.enable;

    hardware.steam-hardware.enable = true;

    environment.systemPackages = [ pkgs.steam ];
  };

  meta.maintainers = with maintainers; [ mkg20001 ];
}
