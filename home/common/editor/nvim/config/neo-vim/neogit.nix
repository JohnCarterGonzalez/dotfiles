{
  programs.nixvim.plugins = {
    neogit = {
      enable = true;
      settings = {
        auto_refresh = true;
        commit_editor.kind = "tab";
      };
    };
  };
}
