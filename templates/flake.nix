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
        c_cpp = {
          description = ''
            Basic flake for C/C++ development
          '';
          path = ./c_cpp;
        };
        node = {
          description = ''
            Basic flake for node dev environment
          '';
          path = ./node;
        };
      };
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}
