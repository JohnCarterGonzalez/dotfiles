{ pkgs, lib, ...}:
{
  programs.nixvim.plugins = {
      neotest = {
        enable = true;
      };
      neoscroll = {
        enable = true;
      };
      neogit = {
        enable = true;
        settings = {
          auto_refresh = true;
          commit_editor.kind = "tab";
        };
      };
      neorg = {
        enable = false;
        lazyLoading = true;
        modules = {
          "core.defaults" = { __empty = null; };
          "core.dirman" = {
            config = {
              workspaces = {
                home = "~/workspaces/mm/home";
                work = "~/workspaces/mm/work";
              };
            };
          };
        };
      };
  };

}
