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
        set -g @plugin 'tmux
        ## COLORSCHEME: gruvbox dark (medium)
        set-option -g status "on"

        # default statusbar color
        set-option -g status-style bg=colour237,fg=colour223 # bg=bg1, fg=fg1

        # default window title colors
        set-window-option -g window-status-style bg=colour214,fg=colour237 # bg=yellow, fg=bg1

        # default window with an activity alert
        set-window-option -g window-status-activity-style bg=colour237,fg=colour248 # bg=bg1, fg=fg3

        # active window title colors
        set-window-option -g window-status-current-style bg=red,fg=colour237 # fg=bg1

        # pane border
        set-option -g pane-active-border-style fg=colour250 #fg2
        set-option -g pane-border-style fg=colour237 #bg1

        # message infos
        set-option -g message-style bg=colour239,fg=colour223 # bg=bg2, fg=fg1

        # writing commands inactive
        set-option -g message-command-style bg=colour239,fg=colour223 # bg=fg3, fg=bg1

        # pane number display
        set-option -g display-panes-active-colour colour250 #fg2
        set-option -g display-panes-colour colour237 #bg1

        # clock
        set-window-option -g clock-mode-colour colour109 #blue

        # bell
        set-window-option -g window-status-bell-style bg=colour167,fg=colour235 # bg=red, fg=bg

        ## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
        set-option -g status-justify "left"
        set-option -g status-left-style none
        set-option -g status-left-length "80"
        set-option -g status-right-style none
        set-option -g status-right-length "80"
        set-window-option -g window-status-separator ""

        set-option -g status-left "#[bg=colour241,fg=colour248] #S #[bg=colour237,fg=colour241,nobold,noitalics,nounderscore]"
        set-option -g status-right "#[bg=colour237,fg=colour239 nobold, nounderscore, noitalics]#[bg=colour239,fg=colour246] %Y-%m-%d  %H:%M #[bg=colour239,fg=colour248,nobold,noitalics,nounderscore]#[bg=colour248,fg=colour237] #h "

        set-window-option -g window-status-current-format "#[bg=colour214,fg=colour237,nobold,noitalics,nounderscore]#[bg=colour214,fg=colour239] #I #[bg=colour214,fg=colour239,bold] #W#{?window_zoomed_flag,*Z,} #[bg=colour237,fg=colour214,nobold,noitalics,nounderscore]"
        set-window-option -g window-status-format "#[bg=colour239,fg=colour237,noitalics]#[bg=colour239,fg=colour223] #I #[bg=colour239,fg=colour223] #W #[bg=colour237,fg=colour239,noitalics]"

        # vim: set ft=tmux tw=0 nowrap:-plugins/tpm'
      '';
    };

}
