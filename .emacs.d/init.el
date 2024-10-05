(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)
(setq-default tab-width 4)
(setq inhibit-startup-message t)
(setq warning-minimum-level ':error)

;; Set auto matching brackets
(electric-pair-mode t)

;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-g") 'evil-normal-state)
(global-set-key (kbd "M-r") 'universal-argument)
(define-key universal-argument-map (kbd "M-r") 'universal-argument-more)

;; (set-frame-font "Iosevka 14" nil t)
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

; put backup files in one unique folder
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

	; always start as a server
(server-start)

;; Email client
(use-package mu4e
  :ensure nil
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")

  (setq mu4e-contexts
        (list
         ;; Work account
         (make-mu4e-context
          :name "personal"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/Gmail" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "franciscoppontes369@gmail.com")
                  (user-full-name    . "Francisco Perestrelo Pontes")
                  (mu4e-drafts-folder  . "/Gmail/[Gmail]/Drafts")
                  (mu4e-sent-folder  . "/Gmail/[Gmail]/Sent Mail")
                  (mu4e-refile-folder  . "/Gmail/[Gmail]/All Mail")
                  (mu4e-trash-folder  . "/Gmail/[Gmail]/Trash")
				  (mu4e-maildir-shortcuts '(:maildir "/Inbox"    :key ?i)
										  (:maildir "/Gmail/[Gmail]/Sent Mail" :key ?s)
										  (:maildir "/Gmail/[Gmail]/Trash"     :key ?t)
										  (:maildir "/Gmail/[Gmail]/Drafts"    :key ?d)
										  (:maildir "/Gmail/[Gmail]/All Mail"  :key ?a))))
		 (make-mu4e-context
          :name "work"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/Work" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "francisco.perestrelo.pontes@gmail.com")
                  (user-full-name    . "Francisco Perestrelo Pontes")
                  (mu4e-drafts-folder  . "/Work/[Gmail]/Drafts")
                  (mu4e-sent-folder  . "/Work/[Gmail]/Sent Mail")
                  (mu4e-refile-folder  . "/Work/[Gmail]/All Mail")
                  (mu4e-trash-folder  . "/Work/[Gmail]/Trash")
				  (mu4e-maildir-shortcuts '(:maildir "/Inbox"    :key ?i)
										  (:maildir "/Work/[Gmail]/Sent Mail" :key ?s)
										  (:maildir "/Work/[Gmail]/Trash"     :key ?t)
										  (:maildir "/Work/[Gmail]/Drafts"    :key ?d)
										  (:maildir "/Work/[Gmail]/All Mail"  :key ?a))))))

  (setq smtpmail-smtp-server "smtp.gmail.com"
		smtpmail-smtp-service 465
		smtpmail-stream-type 'ssl)
  (setq message-send-mail-function 'smtpmail-send-it))

(use-package ace-window
  :bind ("C-c C-g" . 'ace-window)
  :config 
  (setq aw-keys '(?a ?o ?e ?u ?i ?d ?d ?h ?t ?n ?s))
  )

(use-package vterm
  :after (evil)
  :bind ("C-d" . 'evil-scroll-down))

(use-package vterm-toggle
  :requires (vterm))

(use-package org
  :after (evil evil-collection)
  :config
  (evil-define-key 'insert org-mode-map (kbd "M-k")      #'org-previous-visible-heading)
  (evil-define-key 'insert org-mode-map (kbd "M-j")      #'org-next-visible-heading)
  (evil-define-key 'insert org-mode-map (kbd "M-h")      #'org-metaleft)
  (evil-define-key 'insert org-mode-map (kbd "M-l")      #'org-metaright)
  )

(use-package multi-vterm
  :after (vterm vterm-toggle evil evil-collection)
  :config
  (define-key vterm-mode-map [return] #'vterm-send-return)

  (setq vterm-keymap-exceptions nil)
  (evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
  (evil-define-key 'normal vterm-mode-map (kbd ",,")       #'multi-vterm-next)
  (evil-define-key 'normal vterm-mode-map (kbd ",p")       #'multi-vterm-prev)
  (evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume))

(use-package yasnippet
  :init (yas-global-mode))

(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 1.0))

(use-package helpful
  :custom
  (counsel-describe-function-variable #'helpful-callable)
  (counsel-describe-variable-variable #'helpful-variable))

(use-package counsel
  :after ivy
  :requires (smex)
  :config (counsel-mode))

(require 'ivy-posframe)
;; display at `ivy-posframe-style'
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
(setq ivy-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))
(ivy-posframe-mode 1)

(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package ivy-rich
  :after (ivy)
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode))

(use-package swiper
  :after ivy)

(use-package smex)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)

(global-set-key "\C-s" 'swiper)
(global-set-key "\M-x" 'counsel-M-x)
(global-set-key (kbd "C-w") 'evil-delete-backward-word)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c C-h") 'man)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h o") 'counsel-describe-symbol)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
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

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package pdf-tools
  :config
  (pdf-tools-install)(pdf-loader-install))

(defun bugfix-display-line-numbers--turn-on (fun &rest args)
  "Avoid `display-line-numbers-mode' in `image-mode' and related.
Around advice for FUN with ARGS."
  (unless (derived-mode-p 'image-mode 'docview-mode 'pdf-view-mode)
    (apply fun args)))

(advice-add 'display-line-numbers--turn-on :around #'bugfix-display-line-numbers--turn-on)

(use-package zencoding-mode)
(use-package prettier
  :init (global-prettier-mode))

(use-package web-mode
  :after (zencoding-mode prettier mhtml-mode)
  :hook ((web-mode . lsp)(mhtml-mode . zencoding-mode)(web-mode . zencoding-mode))
  :mode (("\\.html$" . web-mode)
	 ("\\.ejs$" . web-mode)
	 ("\\.cshtml$" . web-mode)
	 ("\\.razor$" . web-mode)
	 ("\\.$" . web-mode)
	 ("\\.js$" . web-mode)))


(use-package evil-commentary
  :config (evil-commentary-mode))

(use-package undo-tree
  :config
  (evil-set-undo-system 'undo-tree)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (global-undo-tree-mode)
  :hook
  (prog-mode . turn-on-undo-tree-mode))

(use-package magit)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

;; set type of line numbering (global variable)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(use-package projectile
  :init (projectile-mode)
  :config (setq projectile-auto-discover nil))

(use-package doom-modeline
  :init (doom-modeline-mode))

(use-package general
  :config
  (general-evil-setup))

(use-package all-the-icons)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
   (evil-collection-define-key 'normal 'dired-mode-map
	 "h" 'dired-single-up-directory
	"l" 'dired-single-buffer))
(setq dired-dwim-target t)

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

(use-package all-the-icons-dired
  :config
  (setf dired-kill-when-opening-new-dired-buffer t)
  :hook ((dired-mode . all-the-icons-dired-mode)))

(setq left-fringe-width 16)
(use-package dap-mode
  :bind (
					 ("C-c d a" . 'dap-breakpoint-add )
					 ("C-c d c" . 'dap-breakpoint-condition )
					 ("C-c d d" . 'dap-breakpoint-delete )
					 ))

(use-package lsp-mode
  :hook ((rust-mode . lsp)
	 (js-mode . lsp)
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 (csharp-mode . lsp)
	 (java-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq tab-width 4))
(require 'lsp-java-boot)
(use-package lsp-java
  :after ((dap-mode)(lsp-mode))
  :hook (
		 (java-mode . lsp-mode)
		 (lsp-mode . lsp-lens-mode)
		 (java-mode . lsp-java-boot-mode)
		 )
  :bind (
		 :prefix-map lsp-mode-map
		 :prefix "C-c C-j"
		 ("t" . 'dap-java-run-test-class )
		 ("m" . 'dap-java-run-test-method )
		 ("b" . 'lsp-java-build-project )
		 ("d" . 'dap-java-debug )
		 ))

(add-hook 'compilation-filter-hook
		  (lambda () (ansi-color-apply-on-region (point-min) (point-max))))

(use-package cmake-mode)

(use-package rust-mode
  :config
  (require 'dap-cpptools)
  (dap-cpptools-setup))

(use-package asm-mode
  :hook ((asm-mode . prettier-mode)))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs)

(use-package treemacs-all-the-icons
  :config (setq lsp-treemacs-theme "all-the-icons"))

(use-package treemacs-evil)

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config (setq company-idle-delay nil)
  :bind ("C-w" . 'backward-kill-word))

(use-package flycheck
  :init (global-flycheck-mode))

(general-define-key
 :keymaps 'override
 :states '(visual normal motions insert)
 "C-x b" '(counsel-switch-buffer :which-key "Switch buffer"))
;; (general-define-key
;;  :states 'insert
;;  "C-g" 'evil-normal-state)

(general-define-key
 :keymaps 'normal
 "/" 'swiper
 "à" 'evil-append-line
 "î" 'evil-insert-line
 "g d" '(lsp-find-definition :which-key "Go to definition")
 "g r" '(lsp-find-references :which-key "Find references"))

(general-define-key
 :states '(visual normal insert motions)
 :keymap 'override
 :prefix "C-c"
 :global-prefix "C-c"
 "p" '(:which-key "Project" :keymap projectile-command-map :package projectile)
 "r" '(counsel-grep :which-key "Counsel grep" :package counsel))

;Top level leader keybindings
(general-define-key
 :states '(visual normal motions)
 :keymap 'override
 :prefix "SPC"
 :global-prefix "C-SPC"
 "`" '(evil-switch-to-windows-last-buffer :which-key "Go to last file")
 ";" '(counsel-M-x :which-key "M-x")
 "SPC" '(vterm-toggle :which-key "Vterm toggle")
 "c" '(:which-key "Code")
 "ce" '(:keymap flycheck-command-map :which-key "Errors")
 "cl" '(:keymap lsp-command-map :which-key "lsp" :package lsp-mode)
 "b" '(:which-key "Buffers")
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
 "fo" '(ff-find-other-file :which-key "Go to header/source file")
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
  (load-theme 'doom-moonlight t)
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
   '("9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a" "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40" "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "d537a9d42c6f5349d1716ae9be9a0645cc168f7aff2a8353819d570e5d02c0b3" "df1cbfd16a8af6e821c3299d92c84a0601e961f1be6efd761d6dd40621fde9eb" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" default))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages
   '(lsp-java-boot evil-surround dired-hide-dotfiles dired-single dired-mode all-the-icons-ivy ivy-rich java-mode lsp-java python-black org-mode go-translate cmake-mode sublime-themes multi-vterm pdf-tools zone-nyan dashboard nyan-mode minimap minimap-mode ansi ansii prettier vterm-toggle vterm yasnippet js2-mode zencoding-mode emmet-mode web-mode treemacs-all-the-icons magit-todos all-the-icons-dired dired smex color-theme-sanityinc-tomorrow moe-theme lsp-rust cpp-dbg dap-cpptools dap-mode evil-commentary lsp-ui treemacs-evil rustic magit evil-collection flycheck company company-mode rust-mode all-the-icons lsp-treemacs lsp-mode general projectile which-key doom-modeline counsel helpful ivy evil doom-themes use-package))
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

