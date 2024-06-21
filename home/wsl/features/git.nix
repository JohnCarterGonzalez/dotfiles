{ pkgs
, config
, ...
}: {
  programs.git = {
    enable = true;
    userName = "neto";
    userEmail = "public@neto.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      fetch = {
        prune = true;
      };
    };
  };
}
