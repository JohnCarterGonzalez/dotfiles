{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./features
    inputs.nixvim.homeManagerModules.nixvim
  ];
  nixpkgs = {
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
  };

  home.stateVersion = "23.11";
}
