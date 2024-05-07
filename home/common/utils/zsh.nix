{pkgs, config, lib, ...}:
{
  programs.zsh = {
      enable = true;
      shellAliases = {
        deeno="cd ~/workspaces/projects/work/deno/";
        pypypy="cd ~/workspaces/projects/work/python/";
        ls = "eza -la";
        vi = "nvim";
        ec = "emacsclient -t";
        homeup =
          "cd ~/dotfiles/cfg/ && git add . && cd && darwin-rebuild switch --flake ~/dotfiles/cfg/.#MBP-work";
        darwin = "nvim ~/dotfiles/cfg/nix-darwin/configuration.nix";
      };
    };
}
