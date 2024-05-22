{ pkgs, ...}:
{
  imports = [
    ./zsh.nix
    ./git.nix
    ./firefox.nix
  ];
}
