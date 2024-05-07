{pkgs, lib, config, ...}:
{
  programs.eza = {
      enable = true;
      git = true;
      icons = true;
  };
}
