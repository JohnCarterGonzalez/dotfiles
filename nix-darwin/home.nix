 { pkgs, ... }: {
    home.packages = with pkgs; [ httpie ];
    programs.fish.enable = true;
  
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";
  }
