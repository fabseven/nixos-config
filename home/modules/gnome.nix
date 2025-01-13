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
					#"AlphabeticalAppGrid@stuarthayhurst"
					"appindicatorsupport@rgcjonas.gmail.com"
					"blur-my-shell@aunetx"
					#"just-perfection-desktop@just-perfection"
					"notification-position@drugo.dev"
					"space-bar@luchrioh"
					"tactile@lundal.io"
					#"tophat@fflewddur.github.io"
					"undecorate@sun.wxg@gmail.com"
					"caffeine@patapon.info"
				];
			};

			"org/gnome/desktop/input-sources" = {
				#TODO: Add us and fi layout
				xkb-options = [
					"caps:ctrl_modifier" # map capslock to windows/mac key
				];
			};

			"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
				binding = "<Shift><Super>s";
				command = "${flameshot-gui}/bin/flameshot-gui";
				name = "flameshot screenshot";
			};

			"org/gnome/shell/keybindings/" = {
				switch-to-application-1 = [""];
				switch-to-application-2 = [""];
				switch-to-application-3 = [""];
				switch-to-application-4 = [""];
				switch-to-application-5 = [""];
				switch-to-application-6 = [""];
				switch-to-application-7 = [""];
				switch-to-application-8 = [""];
				switch-to-application-9 = [""];
			};

			"org/gnome/desktop/wm/keybindings" = {
				switch-to-workspace-1 = ["<Super>1"];
				switch-to-workspace-2 = ["<Super>2"];
				switch-to-workspace-3 = ["<Super>3"];
				switch-to-workspace-4 = ["<Super>4"];
				switch-to-workspace-5 = ["<Super>5"];
				switch-to-workspace-6 = ["<Super>6"];
			};

			"org/gnome/shell/extensions/space-bar/behavior" = {
				show-empty-workspaces = true;
			};

			"org/gnome/desktop/wm/preferences" = {
				num-workspaces = 6;
				audible-bell = false;
				auto-raise = true;
				auto-raise-delay = 250;
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
