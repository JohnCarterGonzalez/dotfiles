{ config, pkgs, lib, ... }: {

  programs.nixvim = {
    enable = true;
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
      lualine = {
        enable = true;
      };
      nvim-autopairs = {
        enable = true;
      };
      comment = {
        enable = true;
      };
      nix = {
        enable = true;
      };
      neorg = {
        enable = true;
        modules = {
          "core.defaults" = { __empty = null; };
          "core.dirman" = {
            config = {
              workspaces = {
                home = "~/workspaces/org/home";
                work = "~/workspaces/org/work";
              };
            };
          };
        };
      };
      lsp.enable = true;

      harpoon = {
        enable = true;
        keymaps = {
          addFile = "<leader>ha";
          toggleQuickMenu = "<leader>hm";
        };
      };
      telescope = {
        enable = true;
	settings = {
        defaults.file_ignore_patterns = [ "^.git/" ];
	};
      };

      oil.enable = true;
      treesitter.enable = true;
      clangd-extensions.enable = true;
    };

    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    keymaps = [{
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }];
    autoCmd = [{
      event = [ "BufEnter" "BufWinEnter" ];
      pattern = [ "*.c" "*.h" ];
      command = "echo 'Abandon all hope ye who enter'";
    }];
    extraPlugins = with pkgs.vimPlugins; [
      colorbuddy-nvim
    ];
  };
}
