{config, pkgs, lib, ...}:
{
    programs.alacritty = {
      enable = true;
      settings = {
        env = { "TERM" = "xterm-256color"; };
        window = {
          padding.x = 10;
          padding.y = 10;
          decorations = "None";
          opacity = 0.9;
        };
        font = {
          size = 10.0;
          normal.family = "FiraCode Nerd Font";
          bold.family = "FiraCode Nerd Font";
          italic.family = "FiraCode Nerd Font";
        };
        colors = {
          primary = {
            background = "#1E1E2E";
            foreground = "#CDD6F4";
            dim_foreground = "#CDD6F4";
            bright_foreground = "#CDD6F4";
          };
          normal = {
            black = "#0d0c0c";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#BAC2DE";
          };
          bright = {
            black = "#585B70";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#A6ADC8";
          };
          dim = {
            black = "#45475A";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#BAC2DE";
          };

          selection = {
            text = "#1E1E2E";
            background = "#F5E0DC";
          };
        };
      };
    };

}
