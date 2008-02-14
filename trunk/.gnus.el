;用户资料设定
(setq user-full-name "FOX") ;;把NewBlue改成你自己名字

(setq user-mail-address "yunpeng@163.com")
;;用户电子邮件地址的配置，一般这里我都不填入真是地址，因为现在有通过新闻组
;;搜索电子邮件地址的工具，被那些无耻的广告商用来发送垃圾邮件。

;;(setq message-signature-file "~/signature.file")
;;;;;签名文件

;;;;;;;;;;;;;
;服务器的设定;
;;;;;;;;;;;;;
(setq gnus-select-method '(nntp "news.yaako.com"))
; 雅科服务器

(add-to-list 'gnus-secondary-select-methods '(nntp "news.newsfan.net"))
; 新帆服务器

(add-to-list 'gnus-secondary-select-methods '(nntp "news.cn99.com"))

(add-to-list 'gnus-secondary-select-methods '(nntp "gnu.emacs.sources"))


(gnus-agentize)
;开启代理功能，为了能让gnus支持离线浏览，gnus 5.10.x会自动开启该功能。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;自动换行功能，比起其他的工具要好得多;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'message-mode-hook
	  (lambda ()
	    (setq fill-column 72)
            ;;这里的72是等一行到了72个字符后开始换行
	    (turn-on-auto-fill)))

;;设定回复的时候切掉签名
(setq message-cite-function 'message-cite-original-without-signature)

;;发贴样式表，请根据你自己的需要更改

(setq gnus-posting-styles
      '((".*"
	 (name "FOX");;
	 (address "yunpeng@163.com")
	 (User-Agent "Emacs+gnus")
	 (signature "Love life, love fox")
	 )
))

(setq gnus-summary-show-article-charset-alist 
'((1 . cn-gb-2312) (2 . big5)))

;设定要显示的头信息
(setq gnus-visible-headers
     "^\\(^From:\\|^Subject:\\|^Date:\\|^Followup-To:
     \\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
     \\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

;;;;;;;;;;;;;;
; 开启记分功能;
;;;;;;;;;;;;;;
(setq gnus-use-adaptive-scoring t)
(setq gnus-save-score t)
(add-hook 'message-sent-hook 'gnus-score-followup-article)
(add-hook 'message-sent-hook 'gnus-score-followup-thread)

(defvar gnus-default-adaptive-score-alist
    '((gnus-kill-file-mark (from -10))
        (gnus-unread-mark)
	(gnus-read-mark (from 10) (subjnnect 30))
	(gnus-catchup-mark (subject -10))
	(gnus-killed-mark (from -1) (subject -30))
	(gnus-del-mark (from -2) (subject -15))
	(gnus-ticked-mark (from 10))
	(gnus-dormant-mark (from 5))))

(setq  gnus-score-find-score-files-function
'(gnus-score-find-hierarchical gnus-score-find-bnews bbdb/gnus-score)
gnus-use-adaptive-scoring t)

(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[...]\n"
      )