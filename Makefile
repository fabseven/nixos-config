update: 
	sudo nix flake update
	
# Usage: make nixos HOST=nano   (HOST: thinkbook, thinkpad, xps, nano)
# Without HOST, nixos-rebuild picks the flake output matching the current hostname.
HOST ?=

nixos:
	sudo nixos-rebuild switch --flake .$(if $(HOST),\#$(HOST)) --impure

# Build only, no activation: make build HOST=nano
build:
	nixos-rebuild build --flake .$(if $(HOST),\#$(HOST)) --impure

macos:
	sudo darwin-rebuild switch --flake .#

gc: 
	# run garbage collection
	nix-collect-garbage --delete-older-than 5d

fmt:
	# format the nix files in this repo
	nix fmt ./
