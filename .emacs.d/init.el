(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)
(setq inhibit-startup-message t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-g") 'keyboard-escape-quit)

(set-frame-font "Source code pro 13" nil t)

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
(use-package counsel)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
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

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t))
(evil-mode 1)

(use-package evil-collection
  :init (evil-collection-init))

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

(use-package rust-mode)

(use-package lsp-mode
  :hook ((rust-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-treemacs
  :init
  (lsp-treemacs-sync-mode 1))

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package eshell-z)

(general-define-key
 :states 'insert
 "C-g" 'evil-normal-state)

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
  (load-theme 'doom-challenger-deep t)
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
   '("7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" default))
 '(package-selected-packages
   '(magit evil-collection flycheck company company-mode rust-mode all-the-icons lsp-treemacs lsp-mode general projectile which-key doom-modeline counsel helpful ivy evil doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

