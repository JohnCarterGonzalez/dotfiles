{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../common
    ./features
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
