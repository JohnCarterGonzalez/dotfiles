{ pkgs, lib, config, ... }: { 
programs.wezterm = { 
enable = true; 

extraConfig = ''
        return {
          color_scheme = 'N0Tch2K (Gogh)',
          font_size = 11.0,
          hide_tab_bar_if_only_one_tab = true,
          enable_tab_bar = false,
          enable_scroll_bar = false,
          window_decorations = "RESIZE",
          -- Treat left Alt as Meta
          send_composed_key_when_left_alt_is_pressed = true,
          window_background_opacity = 1.0,

          -- Optionally, do the same for right Alt if you use it
          send_composed_key_when_right_alt_is_pressed = true,
        }
'';
}; 
}
