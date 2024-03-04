{ pkgs, ...}:
{
	imports = [
          ./git.nix
          ./bat.nix
          ./eza.nix
          ./direnv.nix
	];
}

