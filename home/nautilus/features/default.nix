{ pkgs, ...}:
{
	imports = [
	./gui
        ./firefox.nix
        ./git.nix
        ./zsh.nix
	];
}
