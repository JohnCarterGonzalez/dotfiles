{ pkgs, lib, inputs, ... }:
{
  imports = [ 
    ./editor 
  ];
  environment.systemPackages = with pkgs; [
    nix-direnv
    nixfmt
    tree
    eza
    tmux
    direnv
    supabase-cli
    vscode
  ];

  fonts ={
    fontDir.enable = true;
    fonts = with pkgs; [
      fira-code-nerdfont
    ];
  };

  allowUnfree = true;
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    casks = [ "alacritty" "amethyst" "discord" "firefox" "wezterm" ];
  };


  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.johngonzalez = {
    name = "johngonzalez";
    home = "/Users/johngonzalez";
  };
}

