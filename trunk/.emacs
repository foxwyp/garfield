(setq load-path (append load-path '("~/.emacs.d")))

;;color-theme
(load-file "~/.emacs.d/color-theme-almost-monokai.el")
(color-theme-almost-monokai)

;;bookmark
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")
(setq bookmark-save-flag 1)

;;encoding
(require 'unicad)

;;(load-library "vc-svn")
(add-to-list 'vc-handled-backends 'SVN)


;;miscelious
(setq x-select-enable-clipboard t)

(set-scroll-bar-mode nil)

(tool-bar-mode nil)

(display-time)

(setq inhibit-startup-message t)

(setq gnus-inhibit-startup-message t)

(global-set-key (kbd "M-g") 'goto-line)

(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

(column-number-mode t)

(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)


(setq kill-ring-max 200)

;;calendar
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;;tramp
;;from http://irreal.org/blog/?p=895
(require 'tramp)
(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

;;groovy-mode
(add-to-list 'load-path "/usr/share/emacs/site-lisp/groovy-mode")
;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
