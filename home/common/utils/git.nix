{pkgs, lib, config, ...}:
{
  programs.git = {
      enable = true;
      userName = "JCGonzalez";
      userEmail = "public@email.com";
    };
}
