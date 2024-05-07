{ pkgs, ...}:
{
	imports = [
          ./zsh.nix
          #./fish.nix
          ./git.nix
          ./bat.nix
          ./eza.nix
          ./direnv.nix
	];
}

