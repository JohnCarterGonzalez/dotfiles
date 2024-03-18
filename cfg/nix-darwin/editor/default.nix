{ config, pkgs, ... }: {

  programs.nixvim = {
    enable = true;

    plugins = {
      todo-comments = {
        enable = true;
        colors = {
          error = [ "DiagnosticError" "ErrorMsg" "#DC2626" ];
          warning = [ "DiagnosticWarn" "WarningMsg" "#FBBF24" ];
          info = [ "DiagnosticInfo" "#DAA551" ];
          hint = [ "DiagnosticHint" "#10B981" ];
          default = [ "Identifier" "#7C3AED" ];
          test = [ "Identifier" "#FF00FF" ];
        };
        keywords = {
          FIX = {
            icon = " "; # Icon used for the sign, and in search results.
            color = "error"; # Can be a hex color, or a named color.
            alt = [
              "FIXME"
              "BUG"
              "FIXIT"
              "ISSUE"
            ]; # A set of other keywords that all map to this FIX keywords.
          };
          TODO = {
            icon = " ";
            color = "info";
          };
          HACK = {
            icon = " ";
            color = "warning";
          };
          WARN = {
            icon = " ";
            color = "warning";
            alt = [ "WARNING" "XXX" ];
          };
          PERF = {
            icon = " ";
            alt = [ "OPTIM" "PERFORMANCE" "OPTIMIZE" ];
          };
          NOTE = {
            icon = " ";
            color = "hint";
            alt = [ "INFO" ];
          };
          TEST = {
            icon = "⏲ ";
            color = "test";
            alt = [ "TESTING" "PASSED" "FAILED" ];
          };
        };
      };
      neogen = {
        enable = true;
        keymaps = {
          generate = "<leader>ng";
          generateClass = "<leader>ngc";
          generateFunction = "<leader>ngf";
          generateType = "<leader>ngt";
        };
      };
      gitsigns = { enable = true; };
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
      neogit = { enable = true; };
      nix-develop = { enable = true; };
      oil = {
        enable = true;
        skipConfirmForSimpleEdits = true;
      };
      lsp = {
        enable = true;
        servers = {
          denols = { enable = true; };
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          pylyzer = { enable = true; };
          ruff-lsp = { enable = true; };
        };
        keymaps = {
          diagnostics = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
          };
        };

      };
    };
    harpoon = {
      enable = true;
      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>hm";
      };
    };
    telescope = {
      enable = true;
      defaults.file_ignore_patterns = [ "^.git/" ];
    };

    treesitter.enable = true;
    treesitter-context.enable = true;
    clangd-extensions.enable = true;
    nvim-autopairs = {
      enable = true;
      enableAfterQuote = true;
      enableBracketInQuote = true;
    };

    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources =
        [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<C-y>" = {
          action = "cmp.mapping.select_next_item()";
          modes = [ "i" "s" ];
        };
        "<C-c>" = "cmp.mapping.close()";
      };
    };
  };
  extraPlugins = with pkgs;
    [
      (vimUtils.buildVimPlugin {
        name = "mellifluous";
        src = pkgs.fetchFromGitHub {
          owner = "ramojus";
          repo = "mellifluous.nvim";
          rev = "42ccf800b96b4ff401506c3eebabea1975cf2d4b";
          hash = "sha256-uRBAiPHr0+fundLShIvjdyGsA4gPNcUloY79fQ9aGxg=";
        };
      })
    ];

  globals.mapleader = " ";
  keymaps = [{
    action = "<cmd>Telescope find_files<CR>";
    key = "<leader>ff";
  }];
  extraConfigLuaPost = ''
    local opt = vim.opt



    -- TODO: break these settings into the 'options' field of nixvim
    opt.breakindent = true
    opt.clipboard = "unnamedplus"
    opt.hidden = true
    opt.hlsearch = false
    opt.ignorecase = true
    opt.laststatus = 3
    opt.mouse = "a"
    opt.number = true
    opt.relativenumber = true
    opt.signcolumn = "yes"
    opt.smartcase = true
    opt.splitbelow = true
    opt.splitright = true
    opt.termguicolors = true
    opt.undofile = true
    opt.updatetime = 250
    opt.laststatus = 3
    opt.cmdheight = 0
    opt.expandtab = true

    opt.path:remove("/usr/include")
    opt.path:append("**")
    opt.wildignorecase = true
    opt.wildignore:append("**/node_modules/*")
    opt.wildignore:append("**/.git/*")
    local modes = {
      ["n"] = "NORMAL",
      ["no"] = "NORMAL",
      ["v"] = "VISUAL",
      ["V"] = "VISUAL LINE",
      [""] = "VISUAL BLOCK",
      ["s"] = "SELECT",
      ["S"] = "SELECT LINE",
      [""] = "SELECT BLOCK",
      ["i"] = "INSERT",
      ["ic"] = "INSERT",
      ["R"] = "REPLACE",
      ["Rv"] = "VISUAL REPLACE",
      ["c"] = "COMMAND",
      ["cv"] = "VIM EX",
      ["ce"] = "EX",
      ["r"] = "PROMPT",
      ["rm"] = "MOAR",
      ["r?"] = "CONFIRM",
      ["!"] = "SHELL",
      ["t"] = "TERMINAL",
    }

    -- return the current mode and match it with  `modes`
    local function mode()
      local current_mode = vim.api.nvim_get_mode().mode
      return string.format(" %s ", modes[current_mode]):upper()
      end

      -- returns the color of the current mode
      local function update_mode_colors()
      local current_mode = vim.api.nvim_get_mode().mode
      local mode_color = "%#StatusLineAccent#"
      if current_mode == "n" then
          mode_color = "%#StatuslineAccent#"
      elseif current_mode == "i" or current_mode == "ic" then
          mode_color = "%#StatuslineInsertAccent#"
      elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
          mode_color = "%#StatuslineVisualAccent#"
      elseif current_mode == "R" then
          mode_color = "%#StatuslineReplaceAccent#"
      elseif current_mode == "c" then
          mode_color = "%#StatuslineCmdLineAccent#"
      elseif current_mode == "t" then
          mode_color = "%#StatuslineTerminalAccent#"
      end
      return mode_color
    end


    local function filepath()
      local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
      if fpath == "" or fpath == "." then
          return " "
      end

      return string.format(" %%<%s/", fpath)
      end 

      local function filename()
      local fname = vim.fn.expand "%:t"
      if fname == "" then
          return ""
      end
      return fname .. " "
      end

      local function lsp()
      local count = {}
      local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
      }

      for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
      end

      local errors = ""
      local warnings = ""
      local hints = ""
      local info = ""

      if count["errors"] ~= 0 then
        errors = " %#LspDiagnosticsSignError# " .. count["errors"]
      end
      if count["warnings"] ~= 0 then
        warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
      end
      if count["hints"] ~= 0 then
        hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
      end
      if count["info"] ~= 0 then
        info = " %#LspDiagnosticsSignInformation# " .. count["info"]
      end

      return errors .. warnings .. hints .. info .. "%#Normal#"
      end 

      local function filetype()
      return string.format(" %s ", vim.bo.filetype):upper()
      end 

    local function lineinfo()
      if vim.bo.filetype == "alpha" then
        return ""
      end
      return " %P %l:%c "
    end

    Statusline = {}

    Statusline.active = function()
      return table.concat {
        "%#Statusline#",
        update_mode_colors(),
        mode(),
        "%#Normal# ",
        filepath(),
        filename(),
        "%#Normal#",
        lsp(),
        "%=%#StatusLineExtra#",
        filetype(),
        lineinfo(),
      }
    end

    function Statusline.inactive()
      return " %F"
    end

    function Statusline.short()
      return "%#StatusLineNC#   NvimTree"
    end


    vim.api.nvim_exec([[
      augroup Statusline
      au!
      au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
      au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
      au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
      augroup END
    ]], false)


    local vcs = function()
      local git_info = vim.b.gitsigns_status_dict
      if not git_info or git_info.head == "" then
        return ""
      end
      local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
      local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
      local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
      if git_info.added == 0 then
        added = ""
      end
      if git_info.changed == 0 then
        changed = ""
      end
      if git_info.removed == 0 then
        removed = ""
      end
      return table.concat {
         " ",
         added,
         changed,
         removed,
         " ",
         "%#GitSignsAdd# ",
         git_info.head,
         " %#Normal#",
      }
      end 


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

    -- Colorscheme
    require 'mellifluous'.setup({
          dim_inactive = false,
          color_set = 'mellifluous',
          styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
              comments = { italic = true },
              conditionals = {},
              folds = {},
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
              markup = {
                  headings = { bold = true },
              },
          },
          transparent_background = {
              enabled = false,
              floating_windows = true,
              telescope = true,
              file_tree = true,
              cursor_line = true,
              status_line = false,
          },
          flat_background = {
              line_numbers = true,
              floating_windows = false,
              file_tree = false,
              cursor_line_number = true,
          },
          plugins = {
              cmp = true,
              gitsigns = true,
              indent_blankline = false,
              nvim_tree = {
                  enabled = false,
                  show_root = false,
              },
              neo_tree = {
                  enabled = false,
              },
              telescope = {
                  enabled = true,
                  nvchad_like = true,
              },
          },
      })
      vim.cmd('colorscheme mellifluous')
  '';
}
