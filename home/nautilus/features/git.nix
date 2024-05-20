{ pkgs, config, ...}:
{
   programs.git = {
    enable = true;
    userName  = "cpt_n3m0";
    userEmail = "public@email.com";
    aliases = {
      gs = "status";
      ga = "git add";
      gcm = "git commit -m";
      gsc = "git switch -c";
      gf = "git fetch";
      gpl = "git pull";
      gp = "git push";
      gra = "git remote add origin";
    };
  };
}
