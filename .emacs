;; .emacs
(defvar emacs-directory "~/emacs/"
  "The directory containing the emacs configuration files.")

; Define the load-path
; (pushnew (expand-file-name emacs-directory) load-path)

;;; uncomment this line to disable loading of "default.el" at startup
(setq inhibit-default-init t)

(global-font-lock-mode t)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; enable column indicators in the status bar
(setq column-number-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
;;(setq diff-switches "-u")

;; always end a file with a newline
(setq require-final-newline t)

(menu-bar-mode nil)
(tool-bar-mode -1)
(show-paren-mode t)

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
  (fill-paragraph nil)))

(defun kill-entire-line ()
  "Kill this entire line (including newline), regardless of where point is within the line."
  (setq kill-whole-line t)
  (interactive)
  (beginning-of-line)
  (kill-line)
  (setq kill-whole-line nil))

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))


;; Improce ANSI color prompts in shell-mode (emacs22)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)
(setq show-trailing-whitespace t)

;; Additions while at Kabam (2012-11-27).
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(require 'ido)
(ido-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Stop putting backups in the same directory as the files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq scroll-step 1)

(when window-system
  (load-theme 'deeper-blue)
  (menu-bar-mode t)
  (tool-bar-mode -1)
  (set-frame-height (selected-frame) 80)
  (set-frame-width (selected-frame) 100)
  (global-set-key (kbd "s-<down>") 'end-of-buffer)
  (global-set-key (kbd "s-<up>") 'beginning-of-buffer)
  (global-set-key (kbd "s-<right>") 'move-end-of-line)
  (global-set-key (kbd "s-<left>") 'move-beginning-of-line)
  (global-set-key (kbd "s-<backspace>") 'backward-kill-line))
;; TODO: figure out how to use s-<left> etc with the shift modifier to
;; select in those directions. E.g. select from point to end of line.


(setq inhibit-splash-screen t)
(global-set-key "\C-x\C-b" 'electric-buffer-list)

;; Doesn't seem to work.
(add-hook 'after-make-frame-functions
  (lambda ()
    (if (window-system)
	(set-frame-height (selected-frame) 120))))
