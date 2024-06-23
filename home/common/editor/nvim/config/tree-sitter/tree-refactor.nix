{
  programs.nixvim = {
    plugins = {
      treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          clearOnCursorMove = false;
        };
        navigation = {
          enable = true;
          keymaps = {
            gotoDefinition = "gtd";
            gotoNextUsage = "gt;";
            gotoPreviousUsage = "gt:";
            listDefinitionsToc = "gtL";
          };
        };
      };

      treesitter-textobjects = {
        enable = true;
        lspInterop = {
          enable = true;
          border = "rounded";
        };
      };
    };
  };
}
