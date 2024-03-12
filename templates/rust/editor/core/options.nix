{

  config = {
    globals.mapleader = " ";
  keymaps = [{
    action = "<cmd>Telescope find_files<CR>";
    key = "<leader>ff";
  }];
  autoCmd = [{
    event = [ "BufEnter" "BufWinEnter" ];
    pattern = [ "*.c" "*.h" ];
    command = "echo 'Abandon all hope ye who enter'";
  }];

    options = {
      breakindent = true;
      hidden = true;
      hlsearch = false;
      ignorecase = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      undofile = true;
      expandtab = true;
    };
      extraConfigLua = ''
    local opt = vim.opt
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

    -- TODO: break these settings into the 'options' field of nixvim
    opt.clipboard = "unnamedplus"
    opt.laststatus = 3
    opt.signcolumn = "yes"
    opt.updatetime = 250
    opt.laststatus = 3
    opt.cmdheight = 0

    opt.path:remove("/usr/include")
    opt.path:append("**")
    opt.wildignorecase = true
    opt.wildignore:append("**/node_modules/*")
    opt.wildignore:append("**/.git/*")
  '';

  };

}
