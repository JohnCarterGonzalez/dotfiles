{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "johngonzalez";
    homeDirectory = "/Users/johngonzalez";
  };

  programs = {
	home-manager.enable = true;
        direnv.enable = true;
        alacritty = {
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
        starship = {
          enable = true;
        };
        eza = {
          enable = true;
          git = true;
          icons = true;
        };
        zsh = {
          enable = true;
          shellAliases = {
            ls = "eza -la";
            work = "cd ~/workspaces/projects/work";
            notes = "cd ~/workspaces/org && nvim .";
            uni = "cd ~/workspaces/resources/LCTHW/ && nvim .";
            home = "nvim ~/dotfiles/cfg/nix-darwin/home.nix";
            homeup = "cd ~/dotfiles/cfg/ && git add . && cd && darwin-rebuild switch --flake ~/dotfiles/cfg/.#MBP-work";
            darwin = "nvim ~/dotfiles/cfg/nix-darwin/configuration.nix";
            ml = "cd ~/workspaces/projects/hobby_lobby/";
          };
        };
        git = {
          enable = true;
          userName = "JCGonzalez";
          userEmail = "john@selkirk.com";
        };
        bat.enable = true;
        tmux = {
          enable = true;
          keyMode = "vi";
          baseIndex = 1;
          prefix = "C-z";
          extraConfig = ''
            # split windows using | and - 
            bind | split-window -h
            bind - split-window -v

            unbind '"'
            unbind %

            # reload config file
            bind r source-file ~/.tmux.conf

            # switch panes using VIM style with prefix
            bind -r -T prefix h select-pane -L
            bind -r -T prefix l select-pane -R
            bind -r -T prefix k select-pane -U
            bind -r -T prefix j select-pane -D

            # resize panes using VIM style with prefix
            bind -r -T prefix M-h resize-pane -L 5
            bind -r -T prefix M-l resize-pane -R 5 
            bind -r -T prefix M-k resize-pane -U 5 
            bind -r -T prefix M-j resize-pane -D 5

            # DESIGN TWEAKS

            # don't do anything when a 'bell' rings
            set -g visual-activity off
            set -g visual-bell off
            set -g visual-silence off
            setw -g monitor-activity off
            set -g bell-action none

            # clock mode
            setw -g clock-mode-colour colour1


            # messages
            set -g message-style 'fg=colour2 bg=colour0 bold'


            # set up rose_pine_variant
            set -g @plugin 'rose-pine/tmux'
            set -g @rose_pine_variant 'main'

            set -g @rose_pine_host 'on' # Enables hostname in the status bar
            set -g @rose_pine_user 'on' # Turn on the username component in the statusbar
            set -g @rose_pine_directory 'on' # Turn on the current folder component in the status bar
            set -g @rose_pine_bar_bg_disable 'on' # Disables background color, for transparent terminal emulators
            # If @rose_pine_bar_bg_disable is set to 'on', uses the provided value to set the background color
            # It can be any of the on tmux (named colors, 256-color set, `default` or hex colors)
            # See more on http://man.openbsd.org/OpenBSD-current/man1/tmux.1#STYLES
            set -g @rose_pine_bar_bg_disabled_color_option 'default'

            set -g @rose_pine_only_windows 'on' # Leaves only the window module, for max focus and space
            set -g @rose_pine_disable_active_window_menu 'on' # Disables the menu that shows the active window on the left

            set -g @rose_pine_default_window_behavior 'on' # Forces tmux default window list behaviour
            set -g @rose_pine_show_current_program 'on' # Forces tmux to show the current running program as window name
            set -g @rose_pine_show_pane_directory 'on' # Forces tmux to show the current directory as window name
            # Previously set -g @rose_pine_window_tabs_enabled

            # Example values for these can be:
            set -g @rose_pine_left_separator ' > ' # The strings to use as separators are 1-space padded
            set -g @rose_pine_right_separator ' < ' # Accepts both normal chars & nerdfont icons
            set -g @rose_pine_field_separator ' | ' # Again, 1-space padding, it updates with prefix + I

            # These are not padded
            set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
            set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
            set -g @rose_pine_folder_icon '' # Changes the default icon to the left of the current directory folder
            set -g @rose_pine_username_icon '' # Changes the default icon to the right of the hostname
            set -g @rose_pine_hostname_icon '󰒋' # Changes the default icon to the right of the hostname
            set -g @rose_pine_date_time_icon '󰃰' # Changes the default icon to the right of the date module
            set -g @rose_pine_window_status_separator "  " # Changes the default icon that appears between window names

            # Very beta and specific opt-in settings, tested on v3.2a, look at issue #10
            set -g @rose_pine_prioritize_windows 'on' # Disables the right side functionality in a certain window count / terminal width
            set -g @rose_pine_width_to_hide '80' # Specify a terminal width to toggle off most of the right side functionality
            set -g @rose_pine_window_count '5' # Specify a number of windows, if there are more than the number, do the same as width_to_hide




            set -g @plugin 'tmux-plugins/tpm'
          '';
        };
      };

  home.stateVersion = "23.11";
}
