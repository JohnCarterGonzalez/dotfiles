{ config, lib, pkgs, ... }:
{
  programs.fish = {
    enable = true;
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

  programs.thefuck.enableFishIntegration = true;
  programs.rbenv.enableFishIntegration = true;
  programs.opam.enableFishIntegration = true;
}
