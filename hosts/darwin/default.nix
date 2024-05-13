{ inputs, outputs, pkgs, lib, config, ... }: {
  environment.systemPackages = with pkgs; [
    ghidra
    nix-direnv
    nixfmt
    tree
    eza
    tmux
    direnv
    supabase-cli
    bat
    gotop
    poetry
    rustup
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
    casks = [  "obs" "discord" "alfred"];
    brews = [  "tmux" "exercism" "lazygit" "ack" "qemu" "fish" "solargraph" "pyright" "coreutils" "libtool" "cmake" "jq" "livekit" "foreman"  ];
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
