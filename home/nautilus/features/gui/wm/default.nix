{pkgs, config, lib, ... }:
{
xsession.windowManager.i3 = {
    enable = true;
    extraConfig = ''
    	exec_always feh --bg-fill /home/cpt_n3m0/.cfg/assets/wp/road_dark_green.jpg
        exec --no-startup-id picom -c

        gaps inner 3
        gaps outer 2
        smart_gaps on
    '';
    config = {
    	modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      terminal = "wezterm";
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];
    };
  };

  programs.i3status-rust = {
    enable = true;
  };
}
