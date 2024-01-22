{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      home = "nvim ~/dotfiles/home-manager/home.nix";
      homeup =
        "home-manager switch --flake ~/dotfiles/.#kn_kg@nixos";
      system = "nvim ~/dotfiles/nixos/configuration.nix";
      systemup =
        "sudo nixos-rebuild switch --flake ~/dotfiles/.#nixos";
      cleanup = "sudo nix-collect-garbage -d";
      ls = "eza -la";
      edcfg = "nvim ~/dotfiles/home-manager/config/editor/default.nix";
    };
  };
}
