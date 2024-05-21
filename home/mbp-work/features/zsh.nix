{pkgs, config, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la";
      nix-update = "sudo nixos-rebuild switch --flake ~/.cfg/.#nautilus";
      darwin-update = "darwin-rebuild switch --flake ~/.cfg/.#MBP-work";
    };

    history = {
      size = 10000;
    };
  };
}
