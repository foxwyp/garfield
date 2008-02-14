;�û������趨
(setq user-full-name "FOX") ;;��NewBlue�ĳ����Լ�����

(setq user-mail-address "yunpeng@163.com")
;;�û������ʼ���ַ�����ã�һ�������Ҷ����������ǵ�ַ����Ϊ������ͨ��������
;;���������ʼ���ַ�Ĺ��ߣ�����Щ�޳ܵĹ�����������������ʼ���

;;(setq message-signature-file "~/signature.file")
;;;;;ǩ���ļ�

;;;;;;;;;;;;;
;���������趨;
;;;;;;;;;;;;;
(setq gnus-select-method '(nntp "news.yaako.com"))
; �ſƷ�����

(add-to-list 'gnus-secondary-select-methods '(nntp "news.newsfan.net"))
; �·�������

(add-to-list 'gnus-secondary-select-methods '(nntp "news.cn99.com"))

(add-to-list 'gnus-secondary-select-methods '(nntp "gnu.emacs.sources"))


(gnus-agentize)
;���������ܣ�Ϊ������gnus֧�����������gnus 5.10.x���Զ������ù��ܡ�

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;�Զ����й��ܣ����������Ĺ���Ҫ�õö�;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'message-mode-hook
	  (lambda ()
	    (setq fill-column 72)
            ;;�����72�ǵ�һ�е���72���ַ���ʼ����
	    (turn-on-auto-fill)))

;;�趨�ظ���ʱ���е�ǩ��
(setq message-cite-function 'message-cite-original-without-signature)

;;������ʽ����������Լ�����Ҫ����

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

;�趨Ҫ��ʾ��ͷ��Ϣ
(setq gnus-visible-headers
     "^\\(^From:\\|^Subject:\\|^Date:\\|^Followup-To:
     \\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
     \\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

;;;;;;;;;;;;;;
; �����Ƿֹ���;
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