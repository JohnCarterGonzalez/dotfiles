{ pkgs, ... }:
{
  programs.nixvim = {
    colorschemes = {
      modus.enable = true;
      gruvbox.enable = false;
      kanagawa = {
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
        enable = false;
        settings = { };
      };
      catppuccin = {
        enable = false;
        settings = { };
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
