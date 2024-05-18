{config, pkgs, ...}:
{
  users.users.cpt_n3m0.extraGroups = [ "libvirtd" ];

  virtualisation = {
    libvirtd = {
      enable = true;
    };
  };

  programs = {
    virt-manager = {
      enable = true;
    };
  };
}
