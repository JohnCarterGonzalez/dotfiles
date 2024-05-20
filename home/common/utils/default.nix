{ pkgs, ...}:
{
	imports = [
          ./bat.nix
          ./eza.nix
          ./direnv.nix
          ./starship.nix
          ./fonts.nix
	];
}
