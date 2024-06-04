{ pkgs, ... }: {
  imports = [
    ./i3.nix
    ./podman.nix
    ./steam.nix
    ./bluetooth.nix
    ./pulseaudio.nix
    ./gpu.nix
    ./virt-manager.nix
    ./zsh.nix
  ];
}
