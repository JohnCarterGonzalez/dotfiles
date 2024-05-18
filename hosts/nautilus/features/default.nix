{ pkgs, ...}:
{
  imports = [
    ./i3.nix
    ./steam.nix
    ./bluetooth.nix
    ./pulseaudio.nix
    ./gpu.nix
    ./virt-manager.nix
  ];
}
