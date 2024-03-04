{pkgs, config, lib, ...}:
{
      programs.tmux = {
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
        # copy mode
        setw -g mode-style 'fg=colour1 bg=colour18 bold'
        # messages
        set -g message-style 'fg=colour2 bg=colour0 bold'
        # statusbar
        set -g status-position bottom
        set -g status-justify left
        set -g status-style 'fg=colour1'
        set -g status-right '%Y-%m-%d %H:%M '
        set -g status-right-length 50
        set -g status-left-length 10
        # --> Catppuccin (Mocha)
        thm_bg="#1e1e2e"
        thm_fg="#cdd6f4"
        thm_cyan="#89dceb"
        thm_black="#181825"
        thm_gray="#313244"
        thm_magenta="#cba6f7"
        thm_pink="#f5c2e7"
        thm_red="#f38ba8"
        thm_green="#a6e3a1"
        thm_yellow="#f9e2af"
        thm_blue="#89b4fa"
        thm_orange="#fab387"
        thm_black4="#585b70"
        set -g @plugin 'tmux-plugins/tpm'
      '';
    };

}
