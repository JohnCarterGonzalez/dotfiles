{ pkgs, ... }: {
  imports = [  ./zellij.nix ./wezterm.nix ./tmux.nix ./starship.nix ];
}

