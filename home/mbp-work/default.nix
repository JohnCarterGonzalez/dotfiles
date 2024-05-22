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
    username = "johncartergonzalez";
    homeDirectory = "/Users/johncartergonzalez";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
