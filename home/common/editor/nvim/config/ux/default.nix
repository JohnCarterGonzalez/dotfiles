{
  imports = [ ./markdown-preview.nix ./telescope.nix ./harpoon.nix ./lualine.nix ./oil.nix ];

  programs.nixvim = {
    plugins = {
      nvim-autopairs = {
        enable = true;
      };
      comment = {
        enable = true;
      };
      nix = {
        enable = true;
      };

      todo-comments = {
        enable = true;
      };

      trouble = {
        enable = true;
      };

      clangd-extensions.enable = true;
    };
  };
}
