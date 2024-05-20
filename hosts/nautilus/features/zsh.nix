{pkgs, config, ...}:
{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
  };
}
