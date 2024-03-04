{ lib, config, pkgs, ...}: {
	imports = [
	];
	home.packages = with pkgs; [
		mako
		swaybg
		rofi-wayland
	];

wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # -----------------------------------------------------
      # Environment Variables
      # -----------------------------------------------------
      env = WLR_NO_HARDWARE_CURSORS, 1
      env = WLR_RENDERER_ALLOW_SOFTWARE, 1

      # -----------------------------------------------------
      # Monitor Setup
      # See https://wiki.hyprland.org/Configuring/Monitors/
      # -----------------------------------------------------
      # monitor=,2560x1440@120,auto,1
      monitor=,preferred,auto,1
      # monitor=,1920x1080,auto,1

      # -----------------------------------------------------
      # Autostart
      # -----------------------------------------------------
      exec-once = mako

      # -----------------------------------------------------
      # Env vars
      # -----------------------------------------------------
      env = XCURSOR_SIZE,24

      # -----------------------------------------------------
      # Keyboard layout and mouse
      # -----------------------------------------------------
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
          follow_mouse = 1
          touchpad {
              natural_scroll = false
          }
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      # -----------------------------------------------------
      # General window layout and colors
      # -----------------------------------------------------
      general {
          gaps_in = 10
          gaps_out = 14
          border_size = 3
          col.active_border = rgb(aabade)
          col.inactive_border = rgba(ffffffff)
          layout = dwindle
      }

      # -----------------------------------------------------
      # General window decoration
      # -----------------------------------------------------
      decoration { rounding = 10
          active_opacity = 0.9
          inactive_opacity = 0.6
          fullscreen_opacity = 1.0

          drop_shadow = true
          shadow_range = 30
          shadow_render_power = 3
          col.shadow = 0x66000000
      }

      # -----------------------------------------------------
      # Animations
      # -----------------------------------------------------
      animations {
          enabled = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      # -----------------------------------------------------
      # Layouts
      # -----------------------------------------------------
      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = false
      }

      device:epic-mouse-v1 {
          sensitivity = -0.5
      }

      # -----------------------------------------------------
      # Window rules
      # -----------------------------------------------------
      windowrule = tile,^(pavucontrol)$
      windowrule = tile,^(blueman-manager)$


      # -----------------------------------------------------
      # Key bindings
      # -----------------------------------------------------
      $mainMod = SUPER

      bind = $mainMod, Q, exec, alacritty
      bind = $mainMod, E, exec, emacsclient -nc
      bind = $mainMod, S, exec, rofi -show drun
      bind = $mainMod, B, exec, qutebrowser
      bind = $mainMod, D, exec, discord
      bind = $mainMod, C, killactive
      bind = $mainMod, F, exec, firefox
      bind = $mainMod, T, togglefloating
      bind = $mainMod, P, pseudo
      bind = $mainMod, M, exit

      bind = $mainMod, V, togglesplit
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      bind = $mainMod CTRL, Q, exec, wlogout
      bind = $mainMod SHIFT, B, exec, ~/.config/waybar/launch.sh

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = $mainMod SHIFT, right, resizeactive, 100 0
      bind = $mainMod SHIFT, left, resizeactive, -100 0
      bind = $mainMod SHIFT, up, resizeactive, 0 -100
      bind = $mainMod SHIFT, down, resizeactive, 0 100

      # -----------------------------------------------------
      # Misc settings
      # -----------------------------------------------------
      misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
      }
    '';
    systemd.enable = true;
    settings = {
            exec = [
                "${pkgs.swaybg}/bin/swaybg -i ~/dotfiles/assets/wallpapers/night_sky_mountain.jpg --mode fill"
              ];
      };
  };
}
