{
  description = "Development Environment & build system for Deno Projects";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    deno2nix.url = "github:SnO2WMaN/deno2nix";
  };

  outputs = { self, nixpkgs, flake-utils, deno2nix, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          inherit deno2nix;
          overlays = with inputs; [ deno2nix.overlays.default ];
        };
      in {
        packages = {
          executable = deno2nix.mkExecutable {
            pname = "simple-executable";
            version = "0.1.0";

            src = ./.;
            bin = "simple";

            entrypoint = "./mod.ts";
            lockfile = "./deno.lock";
            config = "./deno.jsonc";

            allow = { all = true; };
          };
        };
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [ deno emacsPackages.deno-ts-mode rnix-lsp ];
          };
        };
      });
}
