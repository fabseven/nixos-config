# Dell XPS 15"
{ ... }: {
  imports = [ ../common.nix ../modules/gnome.nix ../modules/kanshi.nix ];

	/* lib.mkForce.home.pointerCursor = {
		size = 14;
	}; */

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
