{ pkgs, config, lib, ... }:
let
  # https://github.com/flameshot-org/flameshot/issues/2848
  flameshot-gui = pkgs.writeShellScriptBin "flameshot-gui" "${pkgs.flameshot}/bin/flameshot gui --raw | wl-copy";
in
{
	dconf = {
		enable = true;
		settings = {
			"org/gnome/shell" = {
				disable-user-extensions = false;
				enabled-extensions = [
					"caffeine@patapon.info"
					"tactile@lundal.io"
					"undeccorate@sun.wxg@gmail.com"
					"space-bar@luchrioh"
					"notification-position@drugo.dev"
					"just-perfection-desktop@just-perfection"
					"blur-my-shell@aunetx"
					"appindicatorsupport@rgcjonas.gmail.com"
				];
			};
			"org/gnome/desktop/input-sources" = {
				sources = [
					('xkb', 'us')
					('xkb', 'fi')
				];
				xkb-options = [
					"caps:super" # map capslock to windows/mac key
					"f:XF86AudioRaiseVolume"
				];
			};
		};
	};
}
