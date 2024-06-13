{ ... }: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "git_files";
      "<leader>fz" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>fo" = "find_files search_dirs={\"$HOME/vaults/windbreaker/org\"}<cr>";
      "<leader>foz" = "live_grep search_dirs={\"$HOME/vaults/windbreaker/org\"}<cr>";
    };
    settings = {
      defaults.file_ignore_patterns = [ "^.git/" ];
    };
    extensions = {
      fzf-native.enable = true;
      ui-select = {
        enable = true;
        settings = {
          specific_opts = {
            code_actions = true;
          };
        };
      };
    };
  };
}
