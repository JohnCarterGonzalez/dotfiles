{ pkgs, config, lib, ...}:
{
	# using b2th headset buttons to control media player
	systemd.user.services.mpris-proxy = {
	    description = "Mpris proxy";
	    after = [ "network.target" "sound.target" ];
	    wantedBy = [ "default.target" ];
	    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
	};

	services.blueman.enable = true;

	hardware = {
  	bluetooth = {
  		enable = true;
  		powerOnBoot = true;
  		settings.General = {
			Enable = "Source,Sink,Media,Socket";
			Experimental = true;
			};
  	};
	};
}
