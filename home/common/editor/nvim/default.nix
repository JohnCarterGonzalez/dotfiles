{ pkgs, ... }: {
  imports = [
    ./config
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    extraConfigLua = ''
      local api = vim.api

      -- Highlight on yank
      api.nvim_exec(
              [[
        augroup YankHighlight
          autocmd!
          autocmd TextYankPost * silent! lua vim.highlight.on_yank()
        augroup end
        ]],
              false
      )
      vim.cmd.colorscheme("gruvbuddy")

    '';

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

    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>fd";
      }
    ];
    autoCmd = [
      {
        event = [ "BufEnter" "BufWinEnter" ];
        pattern = [ "*.c" "*.h" ];
        command = "echo 'Abandon all hope ye who enter'";
      }
    ];
    extraPlugins = with pkgs.vimPlugins; [
      colorbuddy-nvim
    ];
  };
}
