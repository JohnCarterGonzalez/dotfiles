{
  description = "Source Flake for Dotfiles";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in {
      templates = {
        cfg = {
          description = ''
            Dotfiles for NixOS and Nix-Darwin Development Environments
          '';
          path = ./cfg;
        };
        flake-templates = {
          description = ''
            Flake templates for package development or development environments.
            '';
          path = ./templates;
        };
      };
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}
