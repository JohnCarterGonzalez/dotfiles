{pkgs, config, ...}:
{
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
      ## SYS
      nix-update = "sudo nixos-rebuild switch --flake ~/.cfg/.#nautilus";
      soc-update = "sudo nixos-rebuild switch --flake ~/.cfg/.#vaticant";

      ll = "eza -la";
      cd = "z";
      zz = "z -";

      ## GIT
      gi = "git init";
      gs = "status";
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
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
