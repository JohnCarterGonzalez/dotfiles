{pkgs, lib, ...}:
{
  programs.nixvim = {
  plugins = {
    treesitter-refactor = {
        enable = true;
        highlightDefinitions.enable = true;
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

