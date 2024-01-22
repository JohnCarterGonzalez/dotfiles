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
	opacity = 0.7;
      };

      font = {
        size = 10.0;
        # normal.family = "FuraCode Nerd Font";
        # bold.family = "FuraCode Nerd Font";
        # italic.family = "FuraCode Nerd Font";
       };

	colors = {
	  primary = {
	    background = "#161616";
	    foreground= "#ffffff";
	   };

	  normal = {
	    black =   "#262626";
	    magenta = "#ff7eb6";
	    red =     "#ee5396";
	    green =   "#42be65";
	    yellow =  "#ffe97b";
	    blue =    "#33b1ff";
	    cyan =    "#3ddbd9";
	    white =   "#dde1e6";
	   };

	  bright = {
            black =  "#393939";
            magenta =  "#ff7eb6";
            green =  "#42be65";
            yellow =  "#ffe97b";
            blue =  "#33b1ff";
            red =  "#ee5396";
            cyan =  "#3ddbd9";
            white =  "#ffffff";
	   };
	    

	  selection = {
	    background= "#2D4F67";
	    foreground= "#C8C093";
	  };

       	};
      };
  };
}
