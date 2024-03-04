{ pkgs, ...}:
{
	imports = [
          ./zsh.nix
          ./git.nix
          ./bat.nix
          ./eza.nix
          ./direnv.nix
	];
}

