{pkgs, lib, ...}:
{

  imports = [
    ./tree-context.nix
    ./tree-refactor.nix
  ];

    programs.nixvim.plugins.treesitter = {
      enable = true;
      ensureInstalled = [ "python" "c" "javascript" "php" "rust" "nix" "lua" "sql" ];
      folding = false;
      indent = true;
      nixGrammars = true;
      nixvimInjections = true;
    };
}

