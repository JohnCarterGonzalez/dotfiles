{pkgs, ...}:
{
   extraPlugins = 
    [
      (pkgs.vimUtils.buildVimPlugin {
        name = "mellifluous";
        src = pkgs.fetchFromGitHub {
          owner = "ramojus";
          repo = "mellifluous.nvim";
          rev = "42ccf800b96b4ff401506c3eebabea1975cf2d4b";
          hash = "sha256-uRBAiPHr0+fundLShIvjdyGsA4gPNcUloY79fQ9aGxg=";
        };
      })
    ];

  extraConfigLua = ''



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
