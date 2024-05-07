{pkgs, config, lib, ...}:
{
  programs.fish = {
      enable = false;
      functions = {};
      shellAbbrs = {
        ls = "eza -la";
      };
      shellAliases = {
        homeup =
          "cd ~/dotfiles/cfg/ && git add . && cd && darwin-rebuild switch --flake ~/dotfiles/cfg/.#MBP-work";
        vi = "nvim";
      };
    };
}
