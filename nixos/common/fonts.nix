{ pkgs, lib, config, ...}: {
	fonts.packages = with pkgs; [
		nerdfonts
		font-awesome
	];
}
