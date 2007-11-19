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