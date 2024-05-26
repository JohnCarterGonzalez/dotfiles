{ pkgs, ...}:
{
	imports = [
	./gui
        ./git.nix
        ./zsh.nix
        ./fzf.nix
        ./rg.nix
        ./zoxide.nix
	];
}
