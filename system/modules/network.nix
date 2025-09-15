{ ... }:
{

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
    };
    nftables.enable = true; # the new iptables
    networkmanager.enable = true;
    stevenblack.enable = true;
    stevenBlackHosts = {
      blockFakenews = true;
      blockGambling = true;
      blockPorn = true;
      blockSocial = true;
    };
  };
}
