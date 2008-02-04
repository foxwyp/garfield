;;;chinese
(setq ascii-font 
   "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1") 
(setq chinese-font 
  "-outline-������-normal-r-normal-normal-16-*-96-96-c-*-iso10646-1") 
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

;;;Ϊʲô������ʾ��ʱ��ʲô��
(display-time)

;;;Ϊʲô����ʾ��ǰ���ڵ��кź��к�
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

;; �ҳ����ҳ���ɾ����Ҫ�Ķ�����200Ҳ��һ������
(setq kill-ring-max 200)

;; ��������tex����ʱ�õ�������
(setq  TeX-electric-escape t)

;; ������������ѧ���ţ���û��cdlatexǿ
(setq LaTeX-math-mode t) 

;; �ڱ༭texʱ�Զ�����preview-latex
(autoload 'LaTeX-preview-setup "preview")
(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

;;;��������
(setq TeX-source-specials-mode t)

;;;reftex
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(setq reftex-section-levels 
      '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
       ("subsubsection" . 4)  ("paragraph" . 5)
        ("subparagraph" . 6)  ("frametitle" . 4)  ("addchap" . -1) ("addsec" . -2)))
;;�����½ڲ��


;; ��emacs�ܼ����ճ������ʱ�䣬�� calendar ���� S ���ɿ���
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "����")

;; ����������ʾ���� calendar ���� pC ��ʾ����
(setq chinese-calendar-celestial-stem
  ["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
(setq chinese-calendar-terrestrial-branch
  ["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])
  
;; ���� calendar ����ʾ
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ; ��������һΪÿ�ܵĵ�һ��
(setq mark-diary-entries-in-calendar t)     ; ���calendar����diary������
(setq mark-holidays-in-calendar nil)        ; Ϊ��ͻ����diary�����ڣ�calendar�ϲ���ǽ���
(setq view-calendar-holidays-initially nil) ; ��calendar��ʱ����ʾһ�ѽ��� 

;; ȥ�������ĵĽ��գ��趨�Լ�����Ľ��գ��� calendar ���� h ��ʾ����
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "Ԫ��")
                         (holiday-fixed 2 14 "���˽�")
                         (holiday-fixed 3 14 "��ɫ���˽�")
                         (holiday-fixed 4 1 "���˽�")
                         (holiday-fixed 5 1 "�Ͷ���")
                         (holiday-float 5 0 2 "ĸ�׽�")
                         (holiday-fixed 6 1 "��ͯ��")
                         (holiday-float 6 0 3 "���׽�")
                         (holiday-fixed 7 1 "������")
                         (holiday-fixed 8 1 "������")
                         (holiday-fixed 9 10 "��ʦ��")
                         (holiday-fixed 10 1 "�����")
                         (holiday-fixed 12 25 "ʥ����")))
						 
						 
		


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

 ; ���Եݹ��ɾ��Ŀ¼
(setq dired-recursive-deletes t)
; ���Եݹ�Ľ��п���
(setq dired-recursive-copies t)  

;   1. s s �����ļ���С����
;   2. s x �����ļ���չ������
;   3. s t �����ļ�����ʱ������
;   4. s b �����ļ����Ƶ���ĸ˳������

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