{ pkgs, ...}:
{
	imports = [
          ./git.nix
          ./bat.nix
          ./eza.nix
          ./direnv.nix
          ./zsh.nix
          ./starship.nix
          ./fonts.nix
	];
}
