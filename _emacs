(require 'package)
(setq package-archives '(("elpa" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq evil-want-C-u-scroll t)
(setq evil-leader/in-all-states 1)

(package-initialize)

(evil-mode 1)
(require 'evil-leader)
(require 'evil-org)
(require 'ido)

(global-evil-leader-mode)

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(load-theme 'solarized t)

(require 'auto-complete-nxml)

;; Keystroke for popup help about something at point.
(setq auto-complete-nxml-popup-help-key "C-:")

;; Keystroke for toggle on/off automatic completion.
(setq auto-complete-nxml-toggle-automatic-key "C-c C-t")

;; If you want to start completion manually from the beginning
(setq auto-complete-nxml-automatic-p nil)

;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; MS Windows clipboard is UTF-16LE 
(set-clipboard-coding-system 'utf-16le-dos)

;(setq visible-bell 1)
(setq ring-bell-function 'ignore)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


; key bindings
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-<f10>") 'magit-status)
(global-set-key (kbd "<f2>") 'rgrep)

(setq c-basic-indent 2)
(setq-default tab-width 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(nxml-slash-auto-complete-flag t)
 '(tab-stop-list (number-sequence 4 120 4)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; excutable paths 
(setq exec-path (append exec-path
                         '("C:/Program Files/Git/bin")))

(add-to-list 'evil-emacs-state-modes 'eww-mode)
