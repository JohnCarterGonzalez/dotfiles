{pkgs, config, lib, ...}:
{
  programs.zsh = {
      enable = true;
      shellAliases = {
        VIS="cd ~/workspaces/projects/work/python/cert_vision/";
        beaut="cd ~/workspaces/projects/work/python/scraper/";
        deeno="cd ~/workspaces/projects/work/deno/";
        pypypy="cd ~/workspaces/projects/work/python/";
        ls = "eza -la";
        work = "cd ~/workspaces/projects/work";
        notes = "cd ~/workspaces/org && hx .";
        uni = "cd ~/workspaces/resources/LCTHW/ && hx .";
        home = "nvim ~/dotfiles/cfg/nix-darwin/home.nix";
        homeup =
          "cd ~/dotfiles/cfg/ && git add . && cd && darwin-rebuild switch --flake ~/dotfiles/cfg/.#MBP-work";
        darwin = "nvim ~/dotfiles/cfg/nix-darwin/configuration.nix";
        ml = "cd ~/workspaces/projects/hobby_lobby/";
      };
    };
}
