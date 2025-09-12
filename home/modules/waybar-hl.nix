{ config, inputs, ...}: {
  programs.waybar = {
    enable = true;
    package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar;
  };
  xdg.configFile."waybar".source = ../../dotfiles/waybar-hl;
}