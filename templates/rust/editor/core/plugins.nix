{
  plugins = {
    ### The Neo in Neovim ###
    neogen = {
      enable = true;
      keymaps = {
        generate = "<leader>ng";
        generateClass = "<leader>ngc";
        generateFunction = "<leader>ngf";
        generateType = "<leader>ngt";
      };
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

    # Env Integration
    nix-develop = { enable = true; };

    # Git Integration
    neogit = { enable = true; };
    gitsigns = { enable = true; };

    # File Navigation/Manipulation
    oil = {
      enable = true;
      skipConfirmForSimpleEdits = true;
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

    ### Better Comments
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

    # Never type a ), }, ", '.....again
    nvim-autopairs = {
      enable = true;
      enableAfterQuote = true;
      enableBracketInQuote = true;
    };

    ## Core Completion setup
    treesitter.enable = true;
    treesitter-context.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mappings = {
          "<C-y>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        sources =
          [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
      };
    };

  };
}
