(add-to-list 'load-path "~/.emacs.d/")
(setq load-path (append load-path '("~/.emacs.d")))

;;bookmark

;; 书签文件的路径及文件名
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

;; 同步更新书签文件 ;; 或者退出时保存
(setq bookmark-save-flag 1)
;;EMMS
(require 'init-emms)
(require 'emms-extension)

;;save buffer location
(require 'saveplace)
(setq-default save-place t)
;; Put this file into your load-path and the following into your ~/.emacs:

;; (require 'desktop-recover)
;; ;; optionallly:

; (setq desktop-recover-location

; (desktop-recover-fixdir "$HOME/.emacs.d/")) ;; ~/.emacs.d is the default
;; Something like this is highly recommended:
; (prefer-coding-system 'utf-8)
;; ;; Brings up the interactive buffer restore menu
; (desktop-recover-interactive)
;; ;; Note that after using this menu, your desktop will be saved
;; ;; automatically (triggered by the auto-save mechanism).


(require 'unicad)

;(require 'sunrise-commander) 
					;(require 'sunrise-x-buttons) 

					;(require 'saveplace)
					;(setq-default save-place t)

					;(setq-default desktop-load-default t) 


					;(desktop-save-mode 1)
;; Customization follows below
					;   (setq history-length 250)
					;  (add-to-list 'desktop-globals-to-save 'file-name-history)

;;(load-library "vc-svn")
(add-to-list 'vc-handled-backends 'SVN)



;;auto fill buffer 

 (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (setq-default auto-fill-function 'do-auto-fill)

(require 'zenburn)
(color-theme-zenburn)

;字体设置
				
(set-default-font "DejaVu Sans Mono:pixelsize=15")
(set-fontset-font "fontset-default" 'han '("Microsoft Yahei" . "unicode-bmp"))



;;剪切板
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


(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")


;;阴历
					; (require 'cal-china-x)



;; 刷新文件。
(global-set-key (kbd "C-c u") 'revert-buffer)

;; 递归的复制和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(setq dired-listing-switches "-lh")

(add-hook 'dired-mode-hook (lambda ()
			     (interactive)
			     (make-local-variable  'dired-sort-map)
			     (setq dired-sort-map (make-sparse-keymap))
			     (define-key dired-mode-map "s" dired-sort-map)
			     (define-key dired-sort-map "s"
			       '(lambda () "sort by Size"
				  (interactive) (dired-sort-other (concat dired-listing-switches "S"))))
			     (define-key dired-sort-map "x"
			       '(lambda () "sort by eXtension"
				  (interactive) (dired-sort-other (concat dired-listing-switches "X"))))
			     (define-key dired-sort-map "t"
			       '(lambda () "sort by Time"
				  (interactive) (dired-sort-other (concat dired-listing-switches "t"))))
			     (define-key dired-sort-map "n"
			       '(lambda () "sort by Name"
				  (interactive) (dired-sort-other (concat dired-listing-switches ""))))))

;; sort:directories first (emacswiki ÉÏÄ³ŸýÖ®×÷)
(defun his-dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point)
                          (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'his-dired-sort)


;;ÎªÊ²ÃŽ²»ÄÜÏñWindowsÏÂ±àŒ­Æ÷ÄÇÑù, žßÁÁÏÔÊŸÒª¿œ±ŽµÄÇøÓò

(transient-mark-mode t)

;;dired
(require 'dired-x nil t)
(add-to-list 'dired-guess-shell-alist-default '("\\.avi$" "smplayer * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.rm" "smplayer * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.rmvb$" "smplayer * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.pdf$" "acroread * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.chm$" "chmsee * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.doc$" "soffice * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.xls$" "soffice * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.ppt$" "soffice * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.odf$" "soffice * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.odt$" "soffice * &"))
(add-to-list 'dired-guess-shell-alist-default '("\\.ods$" "soffice * &"))

;;ÎÒÒªÏÔÊŸÆ¥ÅäµÄÀšºÅ



(require 'ido)
(ido-mode t)


(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "M--") 'tabbar-backward-group)
(global-set-key (kbd "M-=") 'tabbar-forward-group)
(global-set-key (kbd "M-1") 'tabbar-backward)
(global-set-key (kbd "M-2") 'tabbar-forward) 


;;;auctex
(load "auctex.el" nil t t)
(setq auto-save-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) 

(add-hook 'LaTeX-mode-hook(lambda()
					;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
                            (TeX-PDF-mode t)
                            (setq TeX-save-query  nil )
                            (setq TeX-show-compilation t)
                            ))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(org-agenda-files (quote ("~/.emacs.d/org-mode/fox.org")))
 '(show-paren-mode t))


'(org-agenda-files (quote ("~/fox.org")))

(setq  TeX-electric-escape t)
(setq LaTeX-math-mode t) 

(load "preview-latex.el" nil t t)
(autoload 'LaTeX-preview-setup "preview")
(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

(setq TeX-source-specials-mode t)

;;;reftex
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(setq reftex-section-levels 
      '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
	("subsubsection" . 4)  ("paragraph" . 5)
        ("subparagraph" . 6)  ("frametitle" . 4)  ("addchap" . -1) ("addsec" . -2)))



;; Define a count of the number of words in a highlighted region and bind to F6
;; Handy for forms with word limits and titles with character limits
(defun word-count (start end)
  (interactive "r")
  (let ((words 0) (lines 0) (chars 0))
    (save-excursion
      (goto-char start)
      (while (< (point) end) (forward-word 1) (setq words (1+ words))))
    (setq lines (count-lines start end) chars (- end start))
    (message "Region has  %d lines;   %d words;   %d characters."
             lines words chars)))
(global-set-key [f6] 'word-count)

(setq-default ispell-program-name "aspell")

;;cc-mode
(autoload 'awk-mode "cc-mode" nil t)

					;python mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

					;(put 'scroll-left 'disabled nil)

;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode 
(global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------





;;; turn on syntax hilighting
(global-font-lock-mode 1)



(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
(autoload 'groovy-mode "groovy" nil t)


;(load "/usr/share/emacs/site-lisp/ess/ess-site")


					; automatically get the correct mode 
auto-mode-alist (append (list '("\\.c$" . c-mode)
			      
			      '("\\.S$" . S-mode)
			      '("\\.s$" . S-mode)
			      '("\\.R$" . R-mode)
			      '("\\.r$" . R-mode)
			      '("\\.html$" . html-mode)
					;l '("\\.emacs" . emacs-lisp-mode)
			      )
			auto-mode-alist)




(setq-default inferior-S+6-program-name "Splus")
(setq-default inferior-R-program-name "R")

;;lua-mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;;maxima

(setq load-path (cons "/usr/share/maxima/5.17.1/emacs" load-path))
(autoload 'dbl "dbl")


;;; add autoload of imaxima and maxima.

(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)

(autoload 'maxima "maxima" "Frontend for maxima" t)

;;; add autoload of imath.

(autoload 'imath-mode "imath" "Imath mode for math formula input" t)


;;; Make the line effective if you want to use maxima mode with imaxima.

;; (setq imaxima-use-maxima-mode-flag t)



;;graphviz
					; Commentary:
;; Use this mode for editing files in the dot-language (www.graphviz.org and
;; http://www.research.att.com/sw/tools/graphviz/).
;;
;; To use graphviz-dot-mode, add
(load-file "~/.emacs.d/graphviz-dot-mode.el")
;; to your .emacs or ~/.xemacs/init.el
;;
;; The graphviz-dot-mode will do font locking, indentation, preview of graphs
;; and eases compilation/error location. There is support for both GNU Emacs
;; and XEmacs.
;;
;; Font locking is automatic, indentation uses the same commands as
;; other modes, tab, M-j and C-M-q. Insertion of comments uses the
;; same commands as other modes, M-; . You can compile a file using
;; M-x compile or C-c c, after that M-x next-error will also work.
;; There is support for viewing an generated image with C-c p.

;;org-mode
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; 
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 121 :width normal :foundry "microsoft" :family "微软雅黑")))))



(defun gtd ()
   (interactive)
   (find-file "~/.emacs.d/org-mode/fox.org")
 )
 (setq org-log-done 'time)




;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(add-to-list 'load-path (expand-file-name "/home/fox/code/lisp/emacs-eclim"))

				;	(require 'eclim)

				;	(setq eclim-auto-save t)
				;	(global-eclim-mode)

 ;(load "/usr/share/emacs/site-lisp/nxhtml/autostart.elc")

(add-to-list 'load-path "~/.emacs.d/emacs-jabber-0.8.0")
(require 'jabber-autoloads)
  (setq jabber-account-list
    '(("foxwu718@gmail.com" 
       (:network-server . "talk.google.com")
       (:connection-type . ssl))))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/ajc-java-complete") 
(require 'ajc-java-complete-config)

 (global-auto-revert-mode 1)