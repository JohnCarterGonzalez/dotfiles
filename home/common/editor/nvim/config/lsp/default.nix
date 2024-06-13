{ pkgs, ... }: {
  imports = [ ./cmp.nix ./none-ls.nix ];
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lspsaga.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;
    emmet = {
      enable = true;
      settings.leader_key = "<c-a>";
    };
    lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          ca = "code_action";
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers = {
        ## markdown
        marksman.enable = true;

        ## lua
        lua-ls = {
          enable = true;
        };

        ## c/c++
        clangd.enable = true;

        ## docker
        dockerls.enable = true;

        ## javascript/tailwind
        tsserver.enable = true;
        tailwindcss.enable = true;
        cssls.enable = true;

        ## python
        ruff-lsp.enable = true;
        pyright.enable = true;

        ## php
        phpactor.enable = true;
        emmet_ls = {
          enable = true;
          filetypes = [
            "blade"
            "css"
            "html"
            "less"
            "sass"
            "svelte"
            "vue"
          ];
        };
      };
    };
  };
}
