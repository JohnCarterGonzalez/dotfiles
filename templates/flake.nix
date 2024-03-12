{
  description = "Source Flake for flake-templates";

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
        python = {
          description = ''
		Flake Template for developing Python Projects
          '';
          path = ./python;
        };
        rust = {
          description = ''
            Flake Template for developing Rust projects
          '';
          path = ./rust;
        };
      };
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}
