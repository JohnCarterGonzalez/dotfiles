{ config, pkgs, lib, ... }: {

  home.packages = with pkgs; [
    lua54Packages.lua-utils-nvim
  ];

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
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
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
      # TODO: configure
      neotest = {
        enable = true;
      };
      neoscroll = {
        enable = true;
      };
      neogit = {
        enable = true;
        settings = {
          auto_refresh = true;
          commit_editor.kind = "tab";
        };
      };
      neorg = {
        enable = true;
        lazyLoading = true;
        modules = {
          "core.defaults" = { __empty = null; };
          "core.dirman" = {
            config = {
              workspaces = {
                home = "~/workspaces/mm/home";
                work = "~/workspaces/mm/work";
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
      todo-comments = {
        enable = true;
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
