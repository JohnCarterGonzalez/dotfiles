{ pkgs, ...}:
{
	imports = [
          ./alacritty.nix
          ./tmux.nix
          ./starship.nix
	];
}

