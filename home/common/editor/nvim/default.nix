{ pkgs, ... }: {
  imports = [
    ./config
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    clipboard = {
      register = "unnamedplus";
      providers = {
        xsel.enable = true;
      };
    };
    extraConfigLua = ''
      local api = vim.api
      local cmd = vim.cmd
      local opts = vim.opt

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

      vim.g.blade_custom_directives = {
          'if', 'elseif', 'else', 'endif', 'foreach', 'endforeach', 
          'continue', 'break', 'isset', 'empty', 'auth', 'guest', 
          'endauth', 'csrf', 'verbatim', 'once', 'old', 'switch', 
          'case', 'endswitch', 'include', 'component', 'endcomponent', 
          'props', 'slot', 'endslot', 'yield', 'parent', 'section', 
          'endsection', 'extend', 'includeWhen', 'includeUnless', 
          'php', 'endphp', 'foreach', 'continue', 'endforeach', 'for', 
          'endfor', 'while', 'endwhile', 'forelse', 'endforelse', 
          'unless', 'endunless', 'unless', 'endunless', 'isset', 'empty',
      }

      vim.g.blade_custom_directives_pairs = {
          ['markdown'] = 'endmarkdown',
          ['cache'] = 'endcache',
          ['auth'] = 'endauth',
          ['component'] = 'endcomponent',
          ['slot'] = 'endslot',
          ['section'] = 'endsection',
          ['switch'] = 'endswitch',
          ['foreach'] = 'endforeach',
          ['forelse'] = 'endforelse',
          ['unless'] = 'endunless',
          ['php'] = 'endphp',
      }

    '';

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "vim-blade";
        src = pkgs.fetchFromGitHub {
          owner = "jwalton512";
          repo = "vim-blade";
          rev = "9534101808cc320eef003129a40cab04b026a20c";
          hash = "sha256-DSCHZl/DydC485saAOr4kpHjzEjDxsfzRdty+y4be8Y=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "laravel.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "adalessa";
          repo = "laravel.nvim";
          rev = "baafe3c0072ecb7c8f1efc9ed5e3c96ff4fbf056";
          hash = "sha256-aIhzN5sbtdb8KyrGdPqaMHDDo9dSZDSeNEwR3TVJkAI=";
        };
      })
    ];
  };
}
