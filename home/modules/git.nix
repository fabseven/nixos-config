{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Fabseven";
        email = "fabbycrafted@gmail.com";
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBUcEc6vRCPnjUw1BGpZjxmx0R0iuaJllORb4A2gpVzy";
      };
      gpg = {
        format = "ssh";
        ssh.program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      };
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
