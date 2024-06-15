{
  description = "Nix config for neto";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    with inputs; let
      inherit (self) outputs;

      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages =
        forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system}.alejandra);
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Available through 'nixos-rebuild --flake .#nautilus'
      nixosConfigurations = {
        nautilus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nautilus
          ];
        };
      };

      homeConfigurations = {
        # WSL
        "cpt_n3m0" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            let
              system = "x86_64-linux";
            in
            nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs; };

          modules = [
            ./home/wsl
          ];
        };
      };

      # Available through 'darwin-rebuild switch --flake .#MBP-work'
      darwinConfigurations."MBP-work" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/mbp-work
          nixvim.nixDarwinModules.nixvim
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.johncartergonzalez = import ./home/mbp-work {
                inherit inputs outputs;
                inherit (nixpkgs) lib;
                inherit (config) config pkgs;
              };
            };
          }
        ];
      };
    };
}
