;;;chinese
(setq ascii-font 
   "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1") 
(setq chinese-font 
  "-outline-新宋体-normal-r-normal-normal-16-*-96-96-c-*-iso10646-1") 
(defun zw-set-font (en-font cn-font) 
  (create-fontset-from-fontset-spec 
   (replace-regexp-in-string "iso8859-1" "fontset-zw" en-font)) 
  (set-fontset-font "fontset-zw" 'gb18030 cn-font) 
  (set-fontset-font "fontset-zw" 'latin en-font) 
  (set-fontset-font "fontset-default" 'gb18030 cn-font) 
  (set-fontset-font "fontset-default" 'latin en-font) 
  (set-default-font "fontset-zw") 
  (setq default-frame-alist 
        (append '((font . "fontset-zw")) default-frame-alist))) 

(zw-set-font ascii-font chinese-font) 


(set-language-environment "Chinese-GB18030") 
(setq file-name-coding-system 'gb18030) 

;;;set load path
;;;(setq load-path (append load-path '("~\.emacs.d")))

;;;为什么不能显示个时间什么的
(display-time)

;;;为什么不显示当前所在的行号和列号
(column-number-mode t)
(require 'setnu)
(setnu-mode t)
(global-set-key [f3] (quote setnu-mode))

;;;flyspell
(add-hook 'LaTex-load-hook 'flyspell-mode)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq-default ispell-program-name "aspell")
(setq-default ispell-local-dictionary "american")


;;;auctex
(load "auctex.el" nil t t)
(setq auto-save-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) 


;;;version control
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;; 我承认我常常删除重要的东西，200也不一定够的
(setq kill-ring-max 200)

;; 想在输入tex命令时得到帮助吗
(setq  TeX-electric-escape t)

;; 很容易输入数学符号，但没有cdlatex强
(setq LaTeX-math-mode t) 

;; 在编辑tex时自动调用preview-latex
(autoload 'LaTeX-preview-setup "preview")
(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

;;;反向搜索
(setq TeX-source-specials-mode t)

;;;reftex
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(setq reftex-section-levels 
      '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
       ("subsubsection" . 4)  ("paragraph" . 5)
        ("subparagraph" . 6)  ("frametitle" . 4)  ("addchap" . -1) ("addsec" . -2)))
;;设置章节层次


;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
  
;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t)     ; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil)        ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日 

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))
						 
						 
		


;; user shell to execute the file
(defun w32-browser (doc)
  "Browse to a particular file/URL using default web browser"
  (w32-shell-execute 1 doc))

(eval-after-load "dired"
  '(define-key dired-mode-map [f3] (lambda () 
				     (interactive)
				     (w32-browser
				      (dired-replace-in-string 
				       "/" "\\" 
				       (dired-get-filename))))))

 ; 可以递归的删除目录
(setq dired-recursive-deletes t)
; 可以递归的进行拷贝
(setq dired-recursive-copies t)  

;   1. s s 按照文件大小排序。
;   2. s x 按照文件扩展名排序。
;   3. s t 按照文件访问时间排序。
;   4. s b 按照文件名称的字母顺序排序。

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



;; Load CEDET
(load-file "~/.emacs.d/cedet-1.0pre4/common/cedet.el")

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)
(global-set-key [(f5)] 'speedbar)

;;; jdee
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/jde/lisp"))
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/site/elib"))
  (require 'jde)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(jde-jdk-registry (quote (("1.6.0" . "D:\\Program Files\\Java\\jdk1.6.0_03")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

 
 ;;cc-mode
 (autoload 'awk-mode "cc-mode" nil t)
 
 ;;cscope
 (add-to-list 'load-path (expand-file-name "~/.emacs.d/site/xcscope"))
(require 'xcscope) 

;;;groovy-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/groovy"))
;;; turn on syntax hilighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;for sage
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/sage"))

(load "pyrex-mode")
(load "python-mode")
(setq ipython-command "~/bin/sage")  ;; depends on where your sage is.
(load "sage") 
(require 'ipython)

(fset 'py-shell-fullscreen
   [?\M-x ?p ?y ?- ?s ?h ?e ?l ?l return ?\C-x ?1])
(define-key esc-map "i" 'py-shell-fullscreen)

(setq auto-mode-alist (cons '("\\.pyx\\'" . pyrex-mode) auto-mode-alist)) 
(setq auto-mode-alist (cons '("\\.pxd\\'" . pyrex-mode) auto-mode-alist)) 
(setq auto-mode-alist (cons '("\\.pxi\\'" . python-mode) auto-mode-alist)) 