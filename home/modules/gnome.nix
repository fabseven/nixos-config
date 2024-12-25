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
			};

			"org/gnome/desktop/input-sources" = {
				#TODO: Add us and fi layout
				xkb-options = [
					"caps:ctrl_modifier" # map capslock to windows/mac key
				];
			};

			"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
				binding = [ "<Shift><Super>s" ];
				command = "${flameshot-gui}/bin/flameshot-gui";
				name = "flameshot screenshot";
			};

			"org/gnome/desktop/sound" = {
				event-sounds = false;
			};

			"org/gtk/gtk4/settings/file-chooser" = {
				sort-directories-first = true;
			};

			"org/gnome/nautilus/list-view" = {
				use-tree-view = true;
			};

			"org/gnome/nautilus/preferences" = {
				click-policy = "single";
			};

			"org/gnome/nautilus/preferences" = {
				show-delete-permanently = true;
			};

			"org/gnome/desktop/interface" = {
				clock-format = "24h";
				enable-hot-corners = false;
				show-battery-percentage = true;
			};

			"org/gnome/desktop/peripherals/touchpad" = {
				tap-to-click = true;
			};
		};
	};
}
