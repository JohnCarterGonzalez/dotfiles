{ inputs, outputs, pkgs, lib, config, ... }: {
  environment.systemPackages = with pkgs; [
    devenv
    nix-direnv
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
    onActivation.upgrade = true;
    casks = [  "amethyst" "firefox" "obs" "discord" ];
    brews = [   "tmux"  "lazygit" "ack" "qemu" "pyright" "coreutils" "libtool" "cmake" "jq" "livekit" "foreman"  ];
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.johncartergonzalez = {
    name = "johncartergonzalez";
    home = "/Users/johncartergonzalez";
  };
}
