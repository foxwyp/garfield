;;;chinese
(setq ascii-font 
   "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1") 
(setq chinese-font 
  "-outline-ÐÂËÎÌå-normal-r-normal-normal-16-*-96-96-c-*-iso10646-1") 
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