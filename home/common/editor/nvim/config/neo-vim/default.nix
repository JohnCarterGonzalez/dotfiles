{ pkgs
, lib
, ...
}: {
  home.packages = with pkgs; [
    obsidian
  ];
  programs.nixvim.plugins = {
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

    obsidian = {
      enable = true;
      extraOptions = {
        workspaces = [
          {
            name = "windbreaker";
            path = "~/vaults/windbreaker";
          }
        ];
        notes_subdir = "inbox";
        new_notes_location = "notes_subdir";
        preferred_link_style = "markdown";
        completion = {
          min_chars = 3;
          nvim_cmp = true;
        };
        mappings = {
          gf = {
            action = "require('obsidian').util.gf_passthrough";
            opts = {
              noremap = false;
              expr = true;
              buffer = true;
            };
          };

          "<leader>ch" = {
            action = "require('obsidian').util.toggle_checkbox";
            opts.buffer = true;
          };
        };
        templates = {
          subdir = "templates";
          date_format = "%Y-%m-%d";
          time_format = "%H:%M:%S";
        };
      };
    };
  };
}
