{ pkgs, ... }: {
  imports = [
    ./lsp
    ./tree-sitter
    ./neo-vim
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

      oil = {
        enable = true;
        settings = {
          columns = [
            "icon"
            "size"
            "permission"
          ];
          keymaps = {
            "<C-c>" = false;
            "<C-l>" = false;
            "<C-r>" = "actions.refresh";
            "<leader>qq" = "actions.close";
            "y." = "actions.copy_entry_path";
          };
          skip_confirm_for_simple_edits = true;
          view_options = {
            show_hidden = true;
          };
          win_options = {
            concealcursor = "ncv";
            conceallevel = 3;
            cursorcolumn = false;
            foldcolumn = "0";
            list = false;
            signcolumn = "no";
            spell = false;
            wrap = false;
          };
        };
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
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
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
