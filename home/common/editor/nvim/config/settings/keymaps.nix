{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>fd";
      }
      {
        action = ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>";
        key = "<leader>on";
      }
      {
        action = ":!mv '%:p' $HOME/vaults/windbreaker/notes<cr>:bd<cr>";
        key = "<leader>ok";
      }
      {
        action = ":!rm '%:p'<cr>:bd<cr>";
        key = "<leader>odd";
      }
    ];
  };
}
