# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../common
    ./features
    inputs.nixvim.homeManagerModules.nixvim
  ];

  nixpkgs = {
    overlays = [
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "cpt_n3m0";
    packages = with pkgs; [ httpie ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };

  # Enable home-manager and git
  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
