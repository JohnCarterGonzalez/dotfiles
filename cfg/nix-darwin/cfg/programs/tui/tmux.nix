{ pkgs, config, lib, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    baseIndex = 1;
    prefix = "C-z";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = kanagawa;
        extraConfig =
          "	set -g @kanagawa-show-battery false\n	set -g @kanagawa-show-powerline true\n	set -g @kanagawa-refresh-rate 10\n";
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
    '';
  };

}
