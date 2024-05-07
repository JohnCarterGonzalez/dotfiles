{ pkgs, config, lib, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    baseIndex = 1;
    prefix = "C-z";
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.yank
      tmuxPlugins.net-speed
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];
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
            bind -r -T prefix H resize-pane -L 5
            bind -r -T prefix L resize-pane -R 5 
            bind -r -T prefix K resize-pane -U 5 
            bind -r -T prefix J resize-pane -D 5
            # DESIGN TWEAKS
            # don't do anything when a 'bell' rings
            set -g visual-activity off
            set -g visual-bell off
            set -g visual-silence off
            setw -g monitor-activity off
            set -g bell-action none
            # clock mode
            setw -g clock-mode-colour colour1
            # copy mode
            setw -g mode-style 'fg=colour1 bg=colour18 bold'
            # messages
            set -g message-style 'fg=colour2 bg=colour0 bold'
            # Status {{{
        # Colors {{{
          set -g status-bg '#1c1c1c' # Using Mellifluous background
          set -g status-fg '#dfdfaf' # Using Mellifluous foreground
          set -g status-attr none
        # }}}
      # }}}

      # Window {{{
        # Format {{{
          set -g window-status-separator " "
          set -g window-status-format " #I:#W "
          set -g window-status-current-format " #I:#W "
        # }}}

        # Style {{{
          # For active window style, using Dark Red for bg to highlight
          set -g window-status-current-style fg='#dfdfaf',bg='#875f5f',bold
          # For other windows, using a soft grey to blend with the Mellifluous background
          set -g window-status-style fg='#dfdfaf',bg='#1c1c1c',bold
          set -g window-status-activity-style fg='#dfdfaf',bg='#1c1c1c',bold
        # }}}
      # }}}

      # Panes {{{
        set -g pane-border-bg '#1c1c1c'
        set -g pane-border-fg '#dedcd6' # Slightly adjusted for visibility
        set -g pane-active-border-bg '#1c1c1c'
        set -g pane-active-border-fg '#dfdfaf' # Foreground color for contrast
        set -g display-panes-colour '#dfdfaf'
        set -g display-panes-active-colour '#dfdfaf'
      # }}}

      # Clock Mode {{{
        setw -g clock-mode-colour '#dfdfaf'
      # }}}

      # Messages {{{
        set -g message-fg '#dfdfaf'
        set -g message-bg '#1c1c1c'
        set -g message-command-fg '#dfdfaf'
        set -g message-command-bg '#1c1c1c'
      # }}}

      # Mode (window select / session select) {{{
        set-window-option -g mode-fg '#dfdfaf'
        set-window-option -g mode-bg '#875f5f' # Dark Red for visibility
      # }}}

    '';
  };

}
