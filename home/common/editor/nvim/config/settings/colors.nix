{ pkgs, ... }:
{
  programs.nixvim = {
    colorschemes = {
      modus.enable = false;
      gruvbox.enable = false;
      kanagawa = {
        enable = false;
        settings = { };
      };
      everforest = {
        enable = false;
        settings = { };
      };
      nightfox = {
        enable = false;
        # Type: one of “carbonfox”, “dawnfox”, “dayfox”, “duskfox”, “nightfox”, “nordfox”, “terafox”
        flavor = "carbonfox";
        settings = { };
      };
      oxocarbon.enable = false;
      rose-pine = {
        enable = true;
        settings = {
          before_highlight = "function(group, highlight, palette) end";
          dark_variant = "main";
          dim_inactive_windows = true;
          enable = {
            legacy_highlights = false;
            migrations = true;
            terminal = true;
          };
          extend_background_behind_borders = true;
          groups = {
            border = "muted";
            link = "iris";
            panel = "surface";
          };
          highlight_groups = { };
          styles = {
            bold = false;
            italic = true;
            transparency = true;
          };
          variant = "auto";
        };
      };
      catppuccin = {
        enable = false;
        settings = {
          before_highlight = "function(group, highlight, palette) end";
          dark_variant = "main";
          dim_inactive_windows = true;
          enable = {
            legacy_highlights = false;
            migrations = true;
            terminal = true;
          };
          extend_background_behind_borders = true;
          groups = {
            border = "muted";
            link = "iris";
            panel = "surface";
          };
          highlight_groups = { };
          styles = {
            bold = false;
            italic = true;
            transparency = true;
          };
          variant = "auto";
        };
      };
    };

    extraPlugins = [
      pkgs.vimPlugins.colorbuddy-nvim
    ];

    extraConfigLua = ''
      local cmd = vim.cmd

      -- cmd.colorscheme("gruvbuddy")
    '';
  };
}
