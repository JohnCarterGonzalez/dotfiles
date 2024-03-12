{
  plugins = {
    lsp = {
      enable = true;
      servers = {
	rust-analyzer = { 
		enable = true;
		installCargo = false;
		installRustc = false;
      };
	rnix-lsp.enable = true;
    };
  };
};
}
