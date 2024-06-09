{ pkgs, ... }: {
  programs.nixvim.plugins = {
    neotest = {
      enable = true;
    };
  };
}
