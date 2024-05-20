{ pkgs, ...}:
{
	imports = [
	./gui
        ./git.nix
        ./zsh.nix
	];
}
