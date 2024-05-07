(load (expand-file-name "~/.cfg/home/nautilus/features/gui/editor/modules/crafted-init-config"
                        user-emacs-directory))
(setq-default
 default-frame-alist
 '((tool-bar-lines . 0)
   (menu-bar-lines . 0)
   (undecorated . t)
   (vertical-scroll-bars . nil)
   (horizontal-scroll-bars . nil)))

;;; defaults
;; Buffers Configuration

;; Automatically revert buffers and Dired to reflect external changes
(customize-set-variable 'global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)
(customize-set-variable 'dired-dwim-target t)
(customize-set-variable 'dired-auto-revert-buffer t)

;; Eshell settings
(customize-set-variable 'eshell-scroll-to-bottom-on-input 'this)

;; Window management for buffers
(customize-set-variable 'switch-to-buffer-in-dedicated-window 'pop)
(customize-set-variable 'switch-to-buffer-obey-display-actions t)

;; Prefer ibuffer
(global-set-key [remap list-buffers] #'ibuffer-list-buffers)
(customize-set-variable 'ibuffer-movement-cycle nil)
(customize-set-variable 'ibuffer-old-time 24)

;; Completion Settings

;; Use the best available completion mode based on Emacs version
(if (version< emacs-version "28")
    (if (locate-library "icomplete-vertical")
        (icomplete-vertical-mode 1)
      (icomplete-mode 1))
  (fido-vertical-mode 1))

;; General completion settings
(customize-set-variable 'tab-always-indent 'complete)
(customize-set-variable 'completion-cycle-threshold 3)
(customize-set-variable 'completion-category-overrides '((file (styles . (partial-completion)))))
(customize-set-variable 'completions-detailed t)
(customize-set-variable 'xref-show-definitions-function #'xref-show-definitions-completing-read)

;; Editing Configuration

(delete-selection-mode)
(setq-default indent-tabs-mode nil) ; Use spaces for indentation
(customize-set-variable 'kill-do-not-save-duplicates t)
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1) ; Handle long lines better

;; Dictionary lookup
(global-set-key (kbd "M-#") #'dictionary-lookup-definition)
(add-to-list 'display-buffer-alist
             '("^\\*Dictionary\\*"
               (display-buffer-in-side-window)
               (side . left)
               (window-width . 70)))

;; Spell checking
(with-eval-after-load 'ispell
  (when (executable-find ispell-program-name)
    (add-hook 'text-mode-hook #'flyspell-mode)
    (add-hook 'prog-mode-hook #'flyspell-prog-mode)))

;; Navigation

;; Dumb Jump with Hydra
(when (and (require 'hydra nil :noerror)
           (require 'dumb-jump nil :noerror))
  (defhydra dumb-jump-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back"))
  (global-set-key (kbd "C-M-y") #'dumb-jump-hydra/body))
(with-eval-after-load 'dumb-jump
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; Persistence between sessions

(add-hook 'after-init-hook #'recentf-mode)
(savehist-mode 1)
(customize-set-variable 'bookmark-save-flag 1)

;; Window Management

(winner-mode 1) ; Allows undoing and redoing window configuration changes
(define-prefix-command 'crafted-windows-key-map)
(let ((prefix "C-c w"))
  (global-set-key (kbd (concat prefix " u")) 'winner-undo)
  (global-set-key (kbd (concat prefix " r")) 'winner-redo)
  (global-set-key (kbd (concat prefix " n")) 'windmove-down)
  (global-set-key (kbd (concat prefix " p")) 'windmove-up)
  (global-set-key (kbd (concat prefix " b")) 'windmove-left)
  (global-set-key (kbd (concat prefix " f")) 'windmove-right))

;; Improve scrolling behavior
(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)

;; Man pages and help windows
(customize-set-variable 'Man-notify-method 'aggressive)
(customize-set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)
(add-to-list 'display-buffer-alist
             '("\\*Help\\*"
               (display-buffer-reuse-window display-buffer-pop-up-window)
               (inhibit-same-window . t)))
(add-to-list 'display-buffer-alist
             '("\\*Completions\\*"
               (display-buffer-reuse-window display-buffer-pop-up-window)
               (inhibit-same-window . t)
               (window-height . 10)))

;; Miscellaneous

(customize-set-variable 'load-prefer-newer t)
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)
(unless (version< emacs-version "28")
  (repeat-mode 1))

;;; evil
;; Undo Configuration
(if (version< emacs-version "28")
    (progn
      (require 'undo-tree)
      (global-undo-tree-mode)
      (customize-set-variable 'evil-undo-system 'undo-tree))
  (customize-set-variable 'evil-undo-system 'undo-redo))

;; Pre-load Evil Configurations
(customize-set-variable 'evil-want-integration t)
(customize-set-variable 'evil-want-keybinding nil)
(customize-set-variable 'evil-want-C-i-jump nil)
(customize-set-variable 'evil-respect-visual-line-mode t)
(customize-set-variable 'evil-want-C-h-delete t)

;; Customize Evil further for Vim muscle memory
(customize-set-variable 'evil-want-C-i-jump t)
(customize-set-variable 'evil-want-Y-yank-to-eol t)
(customize-set-variable 'evil-want-fine-undo t)

;; Load Evil and Enable globally
(require 'evil)
(evil-mode 1)

;; Evil Search Configuration
(evil-select-search-module 'evil-search-module 'evil-search)

;; Evil Nerd Commenter Hotkeys
(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

;; Keybindings
(keymap-set evil-insert-state-map "C-g" 'evil-normal-state)
(keymap-global-set "C-M-u" 'universal-argument) ;; Rebind universal-argument
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

;; Discourage Arrow Keys
(defun crafted-evil-discourage-arrow-keys ()
  (interactive)
  (message "Use HJKL keys instead!"))

(dolist (direction '("<left>" "<right>" "<down>" "<up>"))
  (keymap-set evil-normal-state-map direction #'crafted-evil-discourage-arrow-keys)
  (evil-global-set-key 'motion direction #'crafted-evil-discourage-arrow-keys))

;; Ensure certain modes start in Emacs state
(dolist (mode '(custom-mode eshell-mode term-mode))
  (add-to-list 'evil-emacs-state-modes mode))

;; Evil Collection Initialization or Defaults
(if (require 'evil-collection nil :noerror)
    (evil-collection-init)
  ;; Defaults if Evil Collection isn't installed
  (with-eval-after-load 'vertico
    (keymap-set vertico-map "C-j" #'vertico-next)
    (keymap-set vertico-map "C-k" #'vertico-previous)
    (keymap-set vertico-map "M-h" #'vertico-directory-up)))

;;; ui
;; Helpful for Enhanced Help Buffers
(require 'helpful)
(keymap-set helpful-mode-map "<remap> <revert-buffer>" #'helpful-update)
(keymap-global-set "<remap> <describe-command>"        #'helpful-command)
(keymap-global-set "<remap> <describe-function>"       #'helpful-callable)
(keymap-global-set "<remap> <describe-key>"            #'helpful-key)
(keymap-global-set "<remap> <describe-symbol>"         #'helpful-symbol)
(keymap-global-set "<remap> <describe-variable>"       #'helpful-variable)
(keymap-global-set "C-h F"                             #'helpful-function)
(keymap-global-set "C-h K"                             #'describe-keymap) ;; Bind extra `describe-*' commands

;; Line Numbers Configuration
(defcustom crafted-ui-line-numbers-enabled-modes
  '(conf-mode prog-mode)
  "Modes which should display line numbers."
  :type 'list)

(defcustom crafted-ui-line-numbers-disabled-modes
  '(org-mode)
  "Modes which should not display line numbers."
  :type 'list)

(defun crafted-ui--enable-line-numbers-mode ()
  "Turn on line numbers mode."
  (display-line-numbers-mode 1))

(defun crafted-ui--disable-line-numbers-mode ()
  "Turn off line numbers mode."
  (display-line-numbers-mode -1))

(defun crafted-ui--update-line-numbers-display ()
  "Update configuration for line numbers display."
  (dolist (mode crafted-ui-line-numbers-enabled-modes)
    (add-hook (intern (format "%s-hook" mode))
              #'crafted-ui--enable-line-numbers-mode))
  (dolist (mode crafted-ui-line-numbers-disabled-modes)
    (add-hook (intern (format "%s-hook" mode))
              #'crafted-ui--disable-line-numbers-mode))
  (setq-default display-line-numbers-grow-only t
                display-line-numbers-type t
                display-line-numbers-width 2))

(setq crafted-ui-display-line-numbers t)
(crafted-ui--update-line-numbers-display)

;; Elisp-Demos Integration
(require 'elisp-demos)
(advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update)

;; Visual Pulse on Command
(defun pulse-line (&rest _)
  "Pulse the current line."
  (pulse-momentary-highlight-one-line (point)))
(dolist (command '(scroll-up-command scroll-down-command recenter-top-bottom other-window))
  (advice-add command :after #'pulse-line))

;; Breadcrumb Navigation
(require 'breadcrumb)
(breadcrumb-mode)

;;; completion
;; Vertico
(require 'vertico)
(require 'vertico-directory)
(customize-set-variable 'vertico-cycle t)
(vertico-mode 1)
;; Disable conflicting modes
(with-eval-after-load 'crafted-defaults-config
  (fido-mode -1)
  (fido-vertical-mode -1)
  (icomplete-mode -1)
  (icomplete-vertical-mode -1))

;; Marginalia
(require 'marginalia)
(customize-set-variable 'marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode 1)

;; Consult
(require 'consult)
(global-set-key (kbd "C-s") 'consult-line)
(define-key minibuffer-local-map (kbd "C-r") 'consult-history)
(setq completion-in-region-function #'consult-completion-in-region)

;; Orderless
(require 'orderless)
(customize-set-variable 'completion-styles '(orderless basic))
(customize-set-variable 'completion-category-overrides '((file (styles . (partial-completion)))))

;; Embark
(require 'embark)
(global-set-key (kbd "<remap> <describe-bindings>") #'embark-bindings)
(global-set-key (kbd "C-.") 'embark-act)
(setq prefix-help-command #'embark-prefix-help-command)
;; Embark-Consult integration
(require 'embark-consult)
(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode)

;; Corfu
(require 'corfu)
;; Optionally require corfu-terminal for non-graphical displays
(unless (display-graphic-p)
  (require 'corfu-terminal)
  (corfu-terminal-mode +1))
(customize-set-variable 'corfu-cycle t)
(customize-set-variable 'corfu-auto t)
(customize-set-variable 'corfu-auto-prefix 2)
(global-corfu-mode 1)
;; Optionally require corfu-popupinfo for additional info popups
(require 'corfu-popupinfo)
(corfu-popupinfo-mode 1)
(eldoc-add-command #'corfu-insert)
(define-key corfu-map (kbd "M-p") #'corfu-popupinfo-scroll-down)
(define-key corfu-map (kbd "M-n") #'corfu-popupinfo-scroll-up)
(define-key corfu-map (kbd "M-d") #'corfu-popupinfo-toggle)

;; Cape
(require 'cape)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)
(defun crafted-completion-corfu-eshell ()
  "Special settings for when using corfu with eshell."
  (setq-local corfu-quit-at-boundary t
              corfu-quit-no-match t
              corfu-auto nil)
  (corfu-mode))
(add-hook 'eshell-mode-hook #'crafted-completion-corfu-eshell)

;;; ide
;;; Eglot Configuration
(require 'eglot)
(defun crafted-ide--add-eglot-hooks (mode-list)
  "Add `eglot-ensure' to modes in MODE-LIST."
  (dolist (mode mode-list)
    (let ((hook-name (format "%s-hook" (symbol-name mode))))
      (add-hook (intern hook-name) #'eglot-ensure))))
(defun crafted-ide-eglot-auto-ensure-all ()
  "Automatically add `eglot-ensure' to major modes with detected LSP servers."
  (crafted-ide--add-eglot-hooks
   (mapcar #'car
           (seq-filter (lambda (mode-def) (executable-find (cdr mode-def)))
                       eglot-server-programs))))
(customize-set-variable 'eglot-autoshutdown t)

;;; EditorConfig
(require 'editorconfig)
(add-hook 'prog-mode-hook #'editorconfig-mode)

;;; iBuffer Project Integration
(require 'ibuffer-project)
(defun crafted-ide-enhance-ibuffer-with-ibuffer-project ()
  "Enhance ibuffer with ibuffer-project integration."
  (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
  (unless (eq ibuffer-sorting-mode 'alphabetic)
    (ibuffer-do-sort-by-alphabetic)))
(add-hook 'ibuffer-hook #'crafted-ide-enhance-ibuffer-with-ibuffer-project)

;;; VTerm Configuration
(require 'vterm)
(add-hook 'vterm-mode-hook
          (lambda ()
            ;; Modeline serves no purpose in vterm
            (setq-local vterm-kill-buffer-on-exit t)
            (setq-local vterm-max-scrollback 5000)))

;;; org
;; Basic Org settings
(customize-set-variable 'org-return-follows-link t)
(customize-set-variable 'org-mouse-1-follows-link t)
(customize-set-variable 'org-link-descriptive t)
(customize-set-variable 'org-hide-emphasis-markers t)

;; Org mode hooks
(add-hook 'org-mode-hook #'org-indent-mode)  ; Visually indent org-mode files

;; Optional: org-appear integration
;; If org-appear is installed, it will be activated in Org mode buffers.
;; The `require` will fail if org-appear is not available, so you may
;; want to ensure its availability or handle the potential error.
(require 'org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)

;; Enhanced electric-pair integration for Org mode
(defun crafted-org-enhance-electric-pair-inhibit-predicate ()
  "Enhance `electric-pair-mode` behavior in `org-mode`."
  (when (and electric-pair-mode (eq major-mode 'org-mode))
    (setq-local electric-pair-inhibit-predicate
                `(lambda (c)
                   (if (char-equal c ?<)
                       t
                     (,electric-pair-inhibit-predicate c))))))

;; Ensure our electric-pair enhancement is active in Org mode buffers
(add-hook 'electric-pair-mode-hook #'crafted-org-enhance-electric-pair-inhibit-predicate)
(add-hook 'org-mode-hook #'crafted-org-enhance-electric-pair-inhibit-predicate)

;;; personal configuration
(crafted-ide-eglot-auto-ensure-all)

(customize-set-variable 'corfu-auto-delay 0.25)

(with-eval-after-load 'rust-ts-mode
  (require 'rust-mode)
  (keymap-set rust-ts-mode-map "C-c C-c C-u" #'rust-compile)
  (keymap-set rust-ts-mode-map "C-c C-c C-k" #'rust-check)
  (keymap-set rust-ts-mode-map "C-c C-c C-t" #'rust-test)
  (keymap-set rust-ts-mode-map "C-c C-c C-r" #'rust-run)
  (keymap-set rust-ts-mode-map "C-c C-c C-l" #'rust-run-clippy)
  (keymap-set rust-ts-mode-map "C-c C-f" #'rust-format-buffer)
  (keymap-set rust-ts-mode-map "C-c C-n" #'rust-goto-format-problem))


(doom-modeline-mode 1)

(apheleia-global-mode +1)

(require 'which-key)
(which-key-mode)
(which-key-setup-minibuffer)

;;; Keybindings Configuration

(require 'general)

(general-create-definer rune/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(rune/leader-keys
  "u"  '(:ignore t :which-key "utils")
  "ut" '(counsel-load-theme :which-key "choose theme"))

(rune/leader-keys
  "f"  '(:ignore t :which-key "find")
  "ff" '(find-file :which-key "file"))

(rune/leader-keys
  "v"  '(:ignore t :which-key "vterm")
  "vt" '(+vterm/toggle :which-key "toggle vterm"))

;;; _
(provide 'init)
;;; init.el ends here
