{pkgs, config, lib, ...}:
{
	
	nixpkgs.config.pulseaudio = true;
	sound.enable = true;
	hardware = {
		pulseaudio = {
			package = pkgs.pulseaudioFull;
			enable = true;
			extraConfig = ''
			load-module module-combine-sink
			load-module module-switch-on-connect
			'';
			configFile = pkgs.runCommand "default.pa" {} ''
			  sed 's/module-udev-detect$/module-udev-detect tsched=0/' \
			    ${pkgs.pulseaudio}/etc/pulse/default.pa > $out
			'';
		};
	};

}
