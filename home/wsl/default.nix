{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../common
    ./features
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "cpt_n3m0";
    homeDirectory = "/home/cpt_n3m0";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      (import ../../scripts/workflow/shell/obsidian-on.nix { inherit pkgs; })
      (import ../../scripts/workflow/shell/obsidian-og.nix { inherit pkgs; })
      httpie
      devenv
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/cpt_n3m0/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      EDITOR = "nvim";
    };

    # Let Home Manager install and manage itself.
  };

  programs = {
    home-manager.enable = true;
  };
}
