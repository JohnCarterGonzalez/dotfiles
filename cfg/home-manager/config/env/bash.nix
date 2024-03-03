{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      nix-home = "nvim ~/dotfiles/cfg/home-manager/home.nix";
      nix-homeup =
        "home-manager switch --flake ~/dotfiles/cfg/.#kn_kg@nixos";
      system = "nvim ~/dotfiles/cfg/nixos/configuration.nix";
      systemup =
        "sudo nixos-rebuild switch --flake ~/dotfiles/cfg/.#nixos";
      cleanup = "sudo nix-collect-garbage -d";
      ls = "eza -la";
      edcfg = "nvim ~/dotfiles/cfg/home-manager/config/editor/nvim/default.nix";
    };
  };
}
