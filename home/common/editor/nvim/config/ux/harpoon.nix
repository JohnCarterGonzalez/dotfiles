{ lib
, pkgs
, ...
}: {
  programs.nixvim.plugins.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<leader>hm";
    };
  };
}
