{ pkgs, lib, config, ... }: { 
programs.starship = { 
enable = true; 
enableFishIntegration = false;
enableZshIntegration = true;
}; 
}
