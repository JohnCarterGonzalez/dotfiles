{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
	url = "github:nix-community/nixvim";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };
  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
	nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./editor; # import the module directly
	  };
          # 👇 note that it refers to the path ./rust-toolchain.toml
          rustToolchain = pkgs.pkgsBuildHost.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [
            rustToolchain
	    nvim
            ];
	    packages = with pkgs; [ rnix-lsp ]; 
	    shellHook = ''
		echo "Loading Rust development environment"
            '';
          };
        }
      );
}
