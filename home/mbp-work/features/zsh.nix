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
      ls = "eza -la";

      nix-update = "sudo nixos-rebuild switch --flake ~/.cfg/.#nautilus";
      darwin-update = "darwin-rebuild switch --flake ~/.cfg/.#MBP-work";
      composer-up = "nix-shell -p php83Packages.composer";

      nvm = "nvim";

      gs = "git status";
      ga = "git add";
      gcm = "git commit -m";
      gsc = "git switch -c";
      gf = "git fetch";
      gpl = "git pull";
      gp = "git push";
      gra = "git remote add origin";
    };

    history = {
      size = 10000;
    };
  };
}
