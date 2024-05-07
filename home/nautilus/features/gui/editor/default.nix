{ pkgs, config, ...}:
{
  home.packages = with pkgs; [
    tree-sitter
    tree-sitter-grammars.tree-sitter-rust
    libgcc
  ];
  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
    socketActivation.enable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
    #extraConfig = builtins.readFile ./init.el;
    extraPackages = epkgs: [
     # completion support
     # epkgs.cape
     # epkgs.consult
     # epkgs.corfu
     # epkgs.corfu-terminal
     # epkgs.embark
     # epkgs.embark-consult
     # epkgs.marginalia
     # epkgs.orderless
     # epkgs.vertico

     # # ide support
     # epkgs.treesit-auto
     # epkgs.editorconfig
     epkgs.vterm
     # epkgs.aggressive-indent
     # epkgs.ibuffer-project
     # epkgs.general
     # epkgs.which-key
     # epkgs.apheleia

     # # ui support
     epkgs.all-the-icons
     # epkgs.elisp-demos
     # epkgs.helpful
     # epkgs.breadcrumb

     # # org support
     # epkgs.denote
     # epkgs.org-appear

     # # evil support
     # epkgs.evil
     # epkgs.evil-org
     # epkgs.evil-collection
     # epkgs.evil-nerd-commenter

     # # lang support
     # epkgs.rust-mode
     # epkgs.python-mode
     # epkgs.typescript-mode
    ];
  };
}
