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
          opacity = 0.8;
        };
        font = {
          size = 10.0;
          normal.family = "FiraCode Nerd Font";
          bold.family = "FiraCode Nerd Font";
          italic.family = "FiraCode Nerd Font";
        };
        colors = {
          primary = {
            background = "#181818";
            foreground= "0xd4be98";
        };
          normal = {
            black=   "#000000";
            red=     "0xea6962";
            green=   "0xa9b665";
            yellow=  "0xd8a657";
            blue=    "0x7daea3";
            magenta= "0xd3869b";
            cyan=    "0x89b482";
            white=   "0xd4be98";
          };
          bright = {
            black=   "#282828";
            red=     "0xea6962";
            green=   "0xa9b665";
            yellow=  "0xd8a657";
            blue=    "0x7daea3";
            magenta= "0xd3869b";
            cyan=    "0x89b482";
            white=   "0xd4be98";
          };
        };
      };
    };

}
