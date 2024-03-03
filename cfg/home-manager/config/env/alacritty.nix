{ config, lib, pkgs, ...}:
{
  programs.alacritty = {
      enable = true;
      settings = {
        env = {
          "TERM" = "xterm-256color";
        };

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
              background = "#181616";
              foreground= "#c5c9c5";
             };

            normal = {
              black =   "#0d0c0c"; 
              red = "#eb6f92";
              green = "#31748f";
              yellow = "#f6c177";
              blue = "#9ccfd8";
              magenta = "#c4a7e7";
              cyan = "#ebbcba";
              white = "#e0def4";
             };

            bright = {
              black =   "#a6a69c";
              red = "#eb6f92";
              green = "#31748f";
              yellow = "#f6c177";
              blue = "#9ccfd8";
              magenta = "#c4a7e7";
              cyan = "#ebbcba";
              white = "#e0def4";
             };
              

            selection = {
              background= "#2D4F67";
              foreground= "#C8C093";
            };

          };
        };
    };
}
