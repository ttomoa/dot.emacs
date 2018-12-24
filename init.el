(require 'package)

;; HTTPS
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)

;; HTTP
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

;; marmalade　は HTTP アクセスすると証明書エラーでフリーズするので注意
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (mozc ac-slime slime rainbow-delimiters paredit neotree drill-instructor-AZIK-force auto-complete transpose-frame madhat2r-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'tango-dark)

(load "term/bobcat")
(terminal-init-bobcat)

(setq inhibit-startup-message t)

(setq-default show-trailing-whitespace t)

;(menu-bar-mode -1)
(tool-bar-mode -1)
;(global-linum-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

(setq kill-whole-line t)

(setq ring-bell-function 'ignore)

(show-paren-mode t)
(setq show-paren-style 'mixed)

(require 'transpose-frame)

(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'org-mode)
;; http://keisanbutsuriya.hateblo.jp/entry/2015/02/08/175005

;(require 'drill-instructor-AZIK-force)
;(setq drill-instructor-global t)

(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; ---- lisp -----;;
(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'slime)
(slime-setup
 '(slime-repl slime-fancy slime-banner))

;; ac-slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(require 'paredit)
(autoload 'enable-paredit-mode "paredit" t)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(eval-after-load "paredit"
  #'(define-key paredit-mode-map (kbd "C-c f") 'paredit-forward-slurp-sexp))
(eval-after-load "paredit"
  #'(define-key paredit-mode-map (kbd "C-c b") 'paredit-forward-barf-sexp))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; japanese-input
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

;; frame
(setq initial-frame-alist
      (append (list '(width . 120)
		    '(height . 55)
		    '(top . 0)
		    '(left . 400))
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;; https://www.nekochango.com/entry/linux/emacs/setting
;(global-hl-line-mode 0)
(display-time)
(line-number-mode 1)
(column-number-mode 1)
(setq gc-cons-threshold (* 10 gc-cons-threshold))
(setq echo-keystrokes 0.1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)



