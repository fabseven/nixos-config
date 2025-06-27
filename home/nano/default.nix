# Lenovo Thinkpad Nano G2
{ ... }: {
  imports = [ ../common.nix ];

	 lib.mkForce.home.pointerCursor = {
		size = 14;
	}; 

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
