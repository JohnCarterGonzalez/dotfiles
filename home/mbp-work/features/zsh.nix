{ pkgs
, config
, ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    shellAliases = {
      nix-update = "sudo nixos-rebuild switch --flake ~/git/.cfg/.#nautilus";
      darwin-update = "darwin-rebuild switch --flake ~/git/.cfg/.#MBP-work";
      composer-up = "nix-shell -p php83Packages.composer";

      tn = "tmux new-session -s";
      ta = "tmux a -t";
      tk = "tmux kill-session -t";

      di = "devenv init";
      ds = "devenv shell";
      dup = "devenv up";

      gs = "git status";
      ga = "git add";
      gcm = "git commit -m";
      gsc = "git switch -c";
      gf = "git fetch";
      gpl = "git pull";
      gp = "git push";
      gra = "git remote add origin";

      ll = "eza -la";
    };

    history = {
      size = 10000;
    };
  };
}
