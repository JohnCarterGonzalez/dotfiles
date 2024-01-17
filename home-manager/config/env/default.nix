{config, lib, pkgs, ...}: {
	imports = [
		./alacritty.nix
		./nix-direnv.nix
		./blueman.nix
                ./bash.nix
		./eza.nix
		./tmux.nix
                ./starship.nix
	];

}
