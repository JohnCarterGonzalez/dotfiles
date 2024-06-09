{ pkgs, ... }: {
  programs.nixvim.plugins = {
    neoscroll = {
      enable = true;
    };
  };
}
