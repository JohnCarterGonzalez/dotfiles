{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ./features
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      cpt_n3m0 = import ../../home/nautilus;
    };
    backupFileExtension = "backup";
  };

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "vagrant"
        ];
      allowUnfree = true;
    };
  };

  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;
  nix = {
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    nixPath = [ "/etc/nix/path" ];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  environment.systemPackages = with pkgs; [
    google-chrome
    vulkan-tools
    vulkan-loader
    discord
    pavucontrol
    tree
    unzip
    neofetch
    nix-direnv
    devenv
  ];

  networking.hostName = "nautilus";

  boot = {
    loader.systemd-boot.enable = true;
    kernelModules = [ "kvm-amd" "kvm-intel" ];
    initrd.kernelModules = [ "amdgpu" ];
  };

  users = {
    users = {
      cpt_n3m0 = {
        initialPassword = "rootroot";
        isNormalUser = true;
        extraGroups = [ "docker" "qemu-libvirtd" "libvirtd" "disk" "networkmanager" "audio" "sound" "tty" "wheel" ];
      };
    };
  };

  hardware = {
    system76.enableAll = true;
  };

  security.rtkit.enable = true;

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };

  system.stateVersion = "24.05";
}
