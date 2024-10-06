(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(setq-default display-line-numbers 'relative)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)
(setq-default tab-width 4)
(setq inhibit-startup-message t)

;; Set auto matching brackets
(electric-pair-mode t)

(global-set-key (kbd "C-g") 'evil-normal-state)
(global-set-key (kbd "M-r") 'universal-argument)
(define-key universal-argument-map (kbd "M-r") 'universal-argument-more)

(set-frame-font "Iosevka 14" nil t)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

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
  :config
  (setq aw-keys '(?a ?o ?e ?u ?i ?d ?d ?h ?t ?n ?s)))

(use-package vterm
  :after (evil))

(use-package vterm-toggle
  :requires (vterm))

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

(use-package ivy
  :defer 0.1
  :diminish
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config
  (setq ivy-use-virtual-buffers t)
  (ivy-mode))

(use-package ivy-posframe
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters
		'((left-fringe . 8)
		  (right-fringe . 8)))
  (ivy-posframe-mode 1))

(use-package ivy-rich
  :after (ivy)
  :custom
  (ivy-virtual-abbreviate 'full
--rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode))

(use-package swiper
  :after ivy)

(use-package smex)

(setq enable-recursive-minibuffers t)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)

(global-set-key "\C-s" 'swiper)
(global-set-key "\M-x" 'counsel-M-x)
(global-set-key (kbd "C-w") 'evil-delete-backward-word)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c C-h") 'man)
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
  (setq evil-want-integration t)
  :config
  (setq evil-undo-system 'undo-redo))

(evil-mode 1)

(use-package evil-collection
  :init (evil-collection-init))

(use-package pdf-tools
  :config
  (pdf-tools-install)(pdf-loader-install))

; Fix for line numbers in pdf mode
(defun bugfix-display-line-numbers--turn-on (fun &rest args)
  "Avoid `display-line-numbers-mode' in `image-mode' and related.
Around advice for FUN with ARGS."
  (unless (derived-mode-p 'image-mode 'docview-mode 'pdf-view-mode)
    (apply fun args)))

(advice-add 'display-line-numbers--turn-on :around #'bugfix-display-line-numbers--turn-on)

(use-package evil-commentary
  :config (evil-commentary-mode))

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package doom-modeline :init (doom-modeline-mode))

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

(use-package eglot)
(add-to-list 'eglot-server-programs '((c++-mode cc-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(add-hook 'compilation-filter-hook
		  (lambda () (ansi-color-apply-on-region (point-min) (point-max))))

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config (setq company-idle-delay nil)
  :bind ("C-w" . 'backward-kill-word))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package doom-themes
  :config
  (load-theme 'doom-moonlight t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(general-define-key
 :keymaps 'normal
 "/" 'swiper)

;; C-c bindings
(general-define-key
 :states '(visual normal insert motions)
 :keymap 'override
 :prefix "C-c"
 :global-prefix "C-c"
 "C-g" '(ace-window :which-key "Ace window" :package ace-window)
 "r" '(counsel-grep :which-key "Counsel grep" :package counsel))

;Top level leader keybindings
(general-define-key
 :states '(visual normal motions)
 :keymap 'override
 :prefix "SPC"
 :global-prefix "C-SPC"
 ";" '(counsel-M-x :which-key "M-x")
 "SPC" '(vterm-toggle :which-key "Vterm toggle")
 "o" '(:which-key "Pop-ups")
 "e" '(:which-key "Eval")
 "eb" '(eval-buffer :which-key "Eval buffer")
 "es" '(eval-last-sexp :which-key "Eval sexp"))

