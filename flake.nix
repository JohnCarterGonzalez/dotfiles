{
  description = "Dotfiles Config Flake";

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
      };
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}
