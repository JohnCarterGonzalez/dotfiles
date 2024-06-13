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
    initExtra = ''
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
    '';

    shellAliases = {
      nix-update = "sudo nixos-rebuild switch --flake ~/.cfg/.#nautilus";
      darwin-update = "darwin-rebuild switch --flake ~/.cfg/.#MBP-work";
      composer-up = "nix-shell -p php83Packages.composer";

      oo = "cd ~/vaults/windbreaker";
      or = "vi $HOME/vaults/windbreaker/inbox/*.md";

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

      ls = "eza -la";
      cd = "z";
      zz = "z -";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
