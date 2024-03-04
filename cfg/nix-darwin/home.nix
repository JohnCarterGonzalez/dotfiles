{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [ ./cfg ];

  nixpkgs = {
=======
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
nixpkgs = {
    # Configure your nixpkgs instance
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
