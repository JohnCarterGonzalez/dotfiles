{ pkgs, config, ...}:
{
   programs.git = {
    enable = true;
    userName  = "cpt_n3m0";
    userEmail = "public@email.com";
  };
}
