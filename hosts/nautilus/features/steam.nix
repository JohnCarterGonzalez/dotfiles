{ pkgs, ... }:

{
  programs = {
	  steam = {
		  enable = true;
		  gamescopeSession.enable = true;
		  remotePlay.openFirewall = true;
		  dedicatedServer.openFirewall = true;
		  };
	  gamemode.enable = true;
  };

  environment = {
	  systemPackages = with pkgs; [
	    mangohud
	    protonup
	  ];

	  sessionVariables = {
	    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
	      "/home/cpt_n3m0/.steam/root/compatibilitytools.d";
	  };
  };


}
