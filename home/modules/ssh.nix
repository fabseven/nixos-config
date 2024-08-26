{ ... }:

{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = ''
    '';
  };

  services.ssh-agent.enable = true;
}
