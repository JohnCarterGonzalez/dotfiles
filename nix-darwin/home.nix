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

  # home.packages = with pkgs; [ eza httpie ];

  # Enable home-manager and git
  programs = {
	home-manager.enable = true;
        starship = {
          enable = true;
        };
        eza = {
          git = true;
          icons = true;
        };
        zsh = {
          enable = true;
          shellAliases = {
            ls = "eza -la";
            work = "cd ~/workspaces/projects/work";
            notes = "cd ~/workspaces/org && nvim .";
            home = "nvim ~/dotfiles/nix-darwin/home.nix";
            homeup = "cd ~/dotfiles/ && git add . && cd && darwin-rebuild switch --flake ~/dotfiles/.#MBP-work";
            darwin = "nvim ~/dotfiles/nix-darwin/configuration.nix";
            ml = "cd ~/workspaces/projects/hobby_lobby/";
          };
        };
        git.enable = true;
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

            # copy mode
            setw -g mode-style 'fg=colour1 bg=colour18 bold'

            # pane borders
            set -g pane-border-style 'fg=colour1'
            set -g pane-active-border-style 'fg=colour3'

            # statusbar
            set -g status-position bottom
            set -g status-justify left
            set -g status-style 'fg=colour1'
            set -g status-right '%Y-%m-%d %H:%M '
            set -g status-right-length 50
            set -g status-left-length 10

            setw -g window-status-current-style 'fg=colour0 bg=colour1 bold'
            setw -g window-status-current-format ' #I #W #F '

            setw -g window-status-style 'fg=colour1 dim'
            setw -g window-status-format ' #I #[fg=colour7]#W #[fg=colour1]#F '

            setw -g window-status-bell-style 'fg=colour2 bg=colour1 bold'

            # messages
            set -g message-style 'fg=colour2 bg=colour0 bold'
          '';
        };
      };

  home.stateVersion = "23.11";
}
