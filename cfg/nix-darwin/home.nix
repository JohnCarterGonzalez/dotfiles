{ inputs, outputs, lib, config, pkgs, ... }: {

  nixpkgs = {
=======
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = true;
    };
  };

  home = {
    username = "johngonzalez";
    homeDirectory = "/Users/johngonzalez";
  };

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
   starship = { enable = true; };
    eza = {
      enable = true;
      git = true;
      icons = true;
    };
    bat = {
      enable = true;
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
            sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
          };
          file = "Dracula.tmTheme";
        };
      };
    };
    zsh = {
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
        emacs = "emacs --daemon";
        e = "emacsclient -nc";
      };
    };
        git = {
        enable = true;
        userName = "JCGonzalez";
        userEmail = "john@selkirk.com";
        };
    };

  home.stateVersion = "23.11";
}
