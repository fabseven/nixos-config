{ pkgs, ... }:
{
  # Official systray built into the tailscale CLI (needs the operator flag set
  # in system/modules/common.nix).
  systemd.user.services.tailscale-systray = {
    Unit = {
      Description = "Tailscale systray";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.tailscale}/bin/tailscale systray";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
