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




;;;auctex
(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) 


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