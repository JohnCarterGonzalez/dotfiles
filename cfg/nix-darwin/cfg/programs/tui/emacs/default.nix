{ pkgs, config, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [

      nix-mode
      magit
      lsp-mode
      which-key
      mmm-mode

      evil
      evil-org
      evil-collection
      evil-surround
    ];

    extraConfig = builtins.readFile ./init.el;
  };
}
