{ config, pkgs, lib, ... }: {

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
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
        enable = false;
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
      rest = {
        enable = false;
        settings = {
          client = "curl";
          env_file = ".env";
          keybinds = [
            [
              "<localleader>rr"
              "<cmd>Rest run<cr>"
              "Run request under the cursor"
            ]
            [
              "<localleader>rl"
              "<cmd>Rest run last<cr>"
              "Re-run latest request"
            ]
          ];
          logs = {
            level = "info";
            save = true;
          };
          result = {
            split = {
              horizontal = false;
              in_place = false;
              stay_in_current_window_after_split = true;
            };
          };
        };
      };

      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            ca = "code_action";
              K = "hover";
              gD = "references";
              gd = "definition";
              gi = "implementation";
              gt = "type_definition";
          };
        };
        servers = {
          ccls = {
            enable = true;
          };

          phpactor = {
            enable = true;
            autostart = true;
          };

          pylyzer = {
            enable = true;
            autostart = true;
          };

          ruff-lsp = {
            enable = true;
          };

          tsserver = {
            enable = true;
          };
        };
      };
      lspkind = {
        enable = true;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          completion = {
            keyword_length = 3;
          };
          snippets = {
            expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
            '';
          };
        };
        cmdline = {
          "/" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "buffer";
              }
            ];
          };
          ":" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "path";
              }
              {
                name = "cmdline";
                option = {
                  ignore_cmds = [
                    "Man"
                    "!"
                  ];
                };
              }
            ];
          };
        };
      };

      cmp-async-path.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;

      luasnip = {
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

      treesitter = {
        enable = true;
        ensureInstalled = [ "python" "c" "javascript" "php" "rust" "nix" "lua" "sql" ];
        folding = false;
        indent = true;
        nixGrammars = true;
        nixvimInjections = true;
      };

      treesitter-context = {
        enable = true;
        settings = {
          line_numbers = true;
          max_lines = 0;
          min_window_height = 0;
          mode = "topline";
          multiline_threshold = 20;
          separator = "-";
          trim_scope = "inner";
          zindex = 20;
        };
      };

      treesitter-refactor = {
        enable = true;
        highlightDefinitions.enable = true;
        navigation = {
          enable = true;
          keymaps = {
            gotoDefinition = "gtd";
            gotoNextUsage = "gt;";
            gotoPreviousUsage = "gt:";
            listDefinitionsToc = "gtL";
          };
        }; 
      };

      treesitter-textobjects = {
        enable = true;
        lspInterop = {
          enable = true;
          border = "rounded";
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
