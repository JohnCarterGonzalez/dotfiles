{ pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		feh
                picom
		];
	services = {
	displayManager = {
		defaultSession = "none+i3";
	};
	xserver = {
		enable = true;
		desktopManager = {
			xterm.enable = false;
			};


	 windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu 
        i3status 
        i3lock 
        i3blocks 
     ];
    };
  };
  };
}
