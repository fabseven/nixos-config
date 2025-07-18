# ThinkPad
{ ... }: {
  imports = [ 
    ../common.nix 
    ../modules/kanshi.nix
  ];

  home.stateVersion = "24.11";
}
