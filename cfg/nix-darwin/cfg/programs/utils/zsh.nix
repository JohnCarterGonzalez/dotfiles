{pkgs, config, lib, ...}:
{
  programs.zsh = {
      enable = true;
      shellAliases = {
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
