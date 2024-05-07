{pkgs, config, lib, ... }:
{
xsession.windowManager.i3 = {
    enable = true;
    extraConfig = ''
    	exec_always feh --bg-fill /home/cpt_n3m0/.cfg/assets/wp/dream.png
    '';
    config = {
    	modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      terminal = "wezterm";
      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];
    };
  };

  programs.i3status-rust = {
    enable = true;
  };
}
