;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(defun my-esc (prompt)
  "functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
  (cond
   ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "M-g") 'my-esc)


(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")


(setq doom-font (font-spec :family "Source Code Pro" :size 17 :weight 'medium))
(setq doom-theme 'doom-moonlight)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4)

;; Add tab keybindings
(map! :leader :desc "Next tab" :n "t o" #'tab-next)
(map! :leader :desc "Previous tab" :n "t O" #'tab-previous)

;; Hooks
;; get magit todos in magit status
(add-hook 'magit-mode-hook #'magit-todos-mode)


;; Split window horizontally and open vterm
(defun my-split-vterm()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (+vterm/here nil))

(map! :prefix "C-c"
      :desc "terminal"
      "t" )
(map! :prefix "C-c"
      :desc "Split open vterm vertically"
      :n
      "t v" (lambda()
              (interactive)
              (split-window-horizontally)
              (other-window 1)
              (+vterm/here nil)))
(map! :prefix "C-c"
      :desc "Split open vterm horizontally"
      :n
      "t h" (lambda()
              (interactive)
              (split-window-vertically)
              (other-window 1)
              (+vterm/here nil)))

;; vterm keybindings for it to work seamlessly with zsh vi config
(map! :prefix "C-c"
      :map vterm-mode-map
      :desc "Switch to next emacs tab"
      "t o" #'tab-next)
(map! :prefix "C-w"
      :map vterm-mode-map
      :desc "Close window"
      "q" #'delete-window)
(map! :prefix "C-w"
      :map vterm-mode-map
      :desc "Window left"
      "h" #'evil-window-left)
(map! :prefix "C-w"
      :map vterm-mode-map
      :desc "Window right"
      "l" #'evil-window-right)
(map! :prefix "C-w"
      :map vterm-mode-map
      :desc "Window down"
      "j" #'evil-window-down)
(map! :prefix "C-w"
      :map vterm-mode-map
      :desc "Window up"
      "k" #'evil-window-up)
(map! :prefix "C-b"
      :map vterm-mode-map
      :desc "Kill buffer"
      "C-b" #'evil-delete-buffer)

(add-hook! 'vterm-mode-hook #'turn-off-evil-mode)

;; Dired bindings
(map! :map dired-mode-map
      :gn
      "h" #'dired-up-directory)
(map! :map dired-mode-map
      :gn
      "l" #'dired-find-file)
