{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./config
    inputs.nixvim.homeManagerModules.nixvim
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages


    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "kn_kg";
    homeDirectory = "/home/kn_kg";
  };

  home.packages = with pkgs; [ supabase-cli ];

  # Enable home-manager and git
  programs = {
	home-manager.enable = true;
        git.enable = true;
        bat.enable = true;
  };

  services = {
  	mpris-proxy.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
