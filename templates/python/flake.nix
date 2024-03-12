{
  description = "Project using poetry2nix and modular Nixvim configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    poetry2nix = {
	    url = "github:nix-community/poetry2nix";
	    inputs.nixpkgs.follows = "nixpkgs";
	    };
    nixvim = {
	    url = "github:nix-community/nixvim";
	    inputs.nixpkgs.follows = "nixpkgs";
	    };
  };

  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
	nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./editor; # import the module directly
          extraSpecialArgs = {
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
            # inherit (inputs) foo;
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
        inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; })
          mkPoetryApplication;
        projectName = "Beautiful Soup";
      in {
        packages = {
          ${projectName} = mkPoetryApplication { projectDir = self; };
          default = self.packages.${system}.${projectName};
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.${projectName} ];
          buildInputs = [ nvim ];
          packages = with pkgs; [ poetry pylyzer ruff-lsp rnix-lsp ];
          shellHook = ''
            echo "Loading ${projectName} development environment"
          '';
        };
      });
}

