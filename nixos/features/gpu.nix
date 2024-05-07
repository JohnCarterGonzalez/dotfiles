{pkgs, lib, config, ...}:
{
systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

	hardware = {
  	opengl = {
  		enable = true;
		driSupport32Bit = true;
		extraPackages = with pkgs; [
			rocmPackages.clr.icd
			amdvlk
		];
		extraPackages32 = with pkgs; [
		driversi686Linux.amdvlk		
		];
  	};
	};
}
