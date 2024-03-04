{ pkgs, config, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;

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
  services.emacs = {
    enable = true;
    client.enable = true;
    defaultEditor = true;
    socketActivation.enable = true;
  };
}
