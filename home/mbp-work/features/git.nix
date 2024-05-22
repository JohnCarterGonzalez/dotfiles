{ pkgs, config, ...}:
{
   programs.git = {
    enable = true;
    userName  = "neto";
    userEmail = "public@neto.com";
  };
}
