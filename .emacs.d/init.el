(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)
(setq inhibit-startup-message t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-g") 'keyboard-escape-quit)

(set-frame-font "Iosevka 14" nil t)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))

(require 'use-package)

(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 1.0))

(use-package helpful
  :custom
  (counsel-describe-function-variable #'helpful-callable)
  (counsel-describe-variable-variable #'helpful-variable))

(use-package ivy
  :init (ivy-mode))

(use-package smex)

(use-package counsel
  :requires (smex))

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-w") 'evil-delete-backward-word)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h o") 'counsel-describe-symbol)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c b") 'counsel-switch-buffer)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(global-set-key (kbd "C-SPC") 'company-complete)

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t))
(evil-mode 1)

(use-package evil-collection
  :init (evil-collection-init))

(use-package evil-commentary
  :hook ((org-mode . evil-commentary-mode)
	 (elisp-mode . evil-commentary-mode)
	 (lsp-mode . evil-commentary-mode)))


(use-package undo-tree
  :config
  (evil-set-undo-system 'undo-tree)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (global-undo-tree-mode)
  :hook
  (evil-local-mode . turn-on-undo-tree-mode))

(use-package magit)

;; set type of line numbering (global variable)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(use-package projectile
  :init (projectile-mode))

(use-package doom-modeline
  :init (doom-modeline-mode))

(use-package general
  :config
  (general-evil-setup))

(use-package all-the-icons)

(use-package dap-mode)

(use-package lsp-mode
  :hook ((rust-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package rust-mode
  :config
  (require 'dap-cpptools)
  (dap-cpptools-setup))


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :init
  (lsp-treemacs-sync-mode 1))
(use-package treemacs-evil)

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  )

(use-package flycheck
  :init (global-flycheck-mode))

(use-package eshell-z)

(general-define-key
 :states 'insert
 "C-g" 'evil-normal-state)

(general-define-key
 :states 'normal
 "g d" '(lsp-find-definition :which-key "Go to definition")
 "g r" '(lsp-find-references :which-key "Find references"))
 

;Top level leader keybindings
(general-define-key
 :states '(visual normal motions)
 :keymap 'override
 :prefix "SPC"
 :global-prefix "C-SPC"
 "`" '(evil-switch-to-windows-last-buffer :which-key "Go to last file")
 ";" '(counsel-M-x :which-key "M-x")
 "SPC" '(eshell :which-key "Eshell")
 "c" '(:which-key "Code")
 "ce" '(:keymap flycheck-command-map :which-key "Errors")
 "cl" '(:keymap lsp-command-map :which-key "lsp" :package lsp-mode)
 "p" '(:which-key "Project" :keymap projectile-command-map :package projectile)
 "b" '(:which-key "Buffers")
 "bb" '(counsel-switch-buffer :which-key "Switch buffer")
 "h" '(:which-key "Help")
 "hk" '(helpful-key :which-key "Help")
 "hf" '(helpful-callable :which-key "Describe callable")
 "hv" '(helpful-variable :which-key "Describe varible")
 "ha" '(apropos-command :which-key "Apropos")
 "hd" '(apropos-documentation :which-key "Helpful documentation")
 "hp" '(apropos-at-point :which-key "Help at point")
 "f" '(:which-key "File")
 "ff" '(counsel-find-file :which-key "Find file")
 "fs" '(save-buffer :which-key "Save buffer")
 "g" '(:keymap magit-mode-map :which-key "Git" :package magit)
 "gg" '(magit-status :which-key "magit-status")
 "o" '(:which-key "Pop-ups")
 "op" '(treemacs :which-key "Treemacs")
 "w" '(:which-key "Window")
 "wa" '(ace-window :which-key "Ace window")
 "wv" '(evil-window-split 1 :which-key "Split vertical")
 "wv" '(evil-window-split :which-key "Split vertical")
 "ww" '(evil-window-next :which-key "Next window")
 "wh" '(evil-window-left :which-key "Window left")
 "wj" '(evil-window-down :which-key "Window down")
 "wk" '(evil-window-up :which-key "Window up")
 "wl" '(evil-window-right :which-key "Window right")
 "wq" '(evil-quit :which-key "Exit window")
 "e" '(:which-key "Eval")
 "eb" '(eval-buffer :which-key "Eval buffer")
 "es" '(eval-last-sexp :which-key "Eval sexp"))

(use-package doom-themes
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  (doom-themes-org-config))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "d537a9d42c6f5349d1716ae9be9a0645cc168f7aff2a8353819d570e5d02c0b3" "df1cbfd16a8af6e821c3299d92c84a0601e961f1be6efd761d6dd40621fde9eb" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" default))
 '(package-selected-packages
   '(smex color-theme-sanityinc-tomorrow moe-theme lsp-rust cpp-dbg dap-cpptools dap-mode evil-commentary lsp-ui treemacs-evil rustic magit evil-collection flycheck company company-mode rust-mode all-the-icons lsp-treemacs lsp-mode general projectile which-key doom-modeline counsel helpful ivy evil doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

