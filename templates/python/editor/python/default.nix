{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        pylyzer = { enable = true; };
        ruff-lsp = { enable = true; };
      };
    };
  };
}
