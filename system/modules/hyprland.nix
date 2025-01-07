{ inputs, pkgs, ...}: {
	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
	};
  programs.hyprland = {
    enable = true;
		nvidiaPatches = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
