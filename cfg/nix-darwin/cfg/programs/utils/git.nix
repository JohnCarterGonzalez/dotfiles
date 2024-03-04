{pkgs, lib, config, ...}:
{
  programs.git = {
      enable = true;
      userName = "JCGonzalez";
      userEmail = "john@selkirk.com";
    };
}
