;; Reload this file with M-x load-file
;; Reload individual sexp (with point in or at end of sexp) with C-M-x
;; or M-x eval-defun
;;-----------------------------------------------------------------------------
;; Package related. May need to M-x package-refresh-contents
;;-----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Need to install clisp (via Homebrew) first
(setq inferior-lisp-program "/usr/local/bin/clisp")

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

(global-font-lock-mode t)
(setq transient-mark-mode t)
(setq column-number-mode t)
(setq inhibit-splash-screen t)
(setq require-final-newline t)
(menu-bar-mode -1)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq scroll-step 1)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Improce ANSI color prompts in shell-mode (emacs22)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)
(setq show-trailing-whitespace t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Stop putting backups in the same directory as the files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;-----------------------------------------------------------------------------
;; Key bindings (global)
;;-----------------------------------------------------------------------------
(global-set-key "\C-x\C-b" 'electric-buffer-list)

;;-----------------------------------------------------------------------------
;; Cocoa/xemacs specific
;;-----------------------------------------------------------------------------

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
  (global-set-key (kbd "s-<backspace>") 'backward-kill-line)
  (global-set-key (kbd "s-]") 'indent-region))
;; TODO: figure out how to use s-<left> etc with the shift modifier to
;; select in those directions. E.g. select from point to end of line.


;;-----------------------------------------------------------------------------
;; Functions
;;-----------------------------------------------------------------------------

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))


;;-----------------------------------------------------------------------------
;; Customize
;;-----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
