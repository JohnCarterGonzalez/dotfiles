{ pkgs, ...}:
{
	imports = [
	./gui
        ./firefox.nix
        ./git.nix
        ./zsh.nix
        ./fzf.nix
        ./rg.nix
        ./zoxide.nix
	];
}
