{ pkgs, lib, inputs, ... }: {
  imports = [ ./editor ];
  environment.systemPackages = with pkgs; [
    nix-direnv
    nixfmt
    tree
    eza
    tmux
    direnv
    supabase-cli
    bat
    gotop
  ];

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [ fira-code-nerdfont ];
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  homebrew = {
    enable = true;
    # updates homebrew packages on activation,
    # makes builds slower, but I would forget otherwise
    onActivation.upgrade = true;
    casks = [ "alacritty" "amethyst" "discord" "spotify" ];
    brews = [ "livekit" "foreman" ];
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
