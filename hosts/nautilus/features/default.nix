{ pkgs, ... }: {
  imports = [
    ./i3.nix
    ./docker.nix
    ./steam.nix
    ./bluetooth.nix
    ./pulseaudio.nix
    ./gpu.nix
    ./virt-manager.nix
    ./zsh.nix
  ];
}
