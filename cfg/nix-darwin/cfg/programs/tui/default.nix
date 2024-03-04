{ pkgs, ...}:
{
	imports = [
          ./alacritty.nix
          ./emacs
          ./tmux.nix
          ./starship.nix
	];
}

