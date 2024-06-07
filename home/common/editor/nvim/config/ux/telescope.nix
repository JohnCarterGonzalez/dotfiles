{ ... }: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "git_files";
      "<leader>fz" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
    };
    settings = {
      defaults.file_ignore_patterns = [ "^.git/" ];
    };
    extensions = {
      fzf-native.enable = true;
      frecency.enable = true;
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
