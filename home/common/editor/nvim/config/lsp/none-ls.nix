{ pkgs, ... }: {
  programs.nixvim.plugins.none-ls = {
    enable = true;
    cmd = [ "bash -c nvim" ];
    debug = true;
    sources = {
      code_actions = {
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        deadnix.enable = true;
      };
      formatting = {
        stylua = {
          enable = true;
          package = pkgs.stylua;
        };
        nixpkgs_fmt = {
          enable = true;
          package = pkgs.nixpkgs-fmt;
        };
        prettierd = {
          enable = true;
          package = pkgs.prettierd;
        };
        rustywind = {
          enable = true;
          package = pkgs.rustywind;
        };
        black = {
          enable = true;
          package = pkgs.black;
        };
      };
    };
  };
}
