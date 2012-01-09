;;; init-emms.el --- Emms configuration

;; Filename: init-emms.el
;; Description: Emms configuration
;; Author: Andy Stewart lazycat.manatee@gmail.com
;; Maintainer: Andy Stewart lazycat.manatee@gmail.com
;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.
;; Created: 2008-10-20 09:45:31
;; Version: 0.1
;; Last-Updated: 2008-10-20 09:45:31
;;           By: Andy Stewart
;; URL:
;; Keywords: emms
;; Compatibility: GNU Emacs 23.0.60.1
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Emms configuration
;;

;;; Installation:
;;
;; Put init-emms.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-emms)
;;
;; No need more.

;;; Change log:
;;
;; 2008/10/20
;;      First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require
  
;;; Code:

 (require 'emms-setup)

     


(emms-devel)    
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)                                                          ;选择开发者模式
;; 目录
;(setq emms-directory "~/MyEmacs/Configure-File/Emms/")                    ;设置EMMS的目录
;(setq emms-history-file "~/MyEmacs/Configure-File/Emms/history")          ;播放列表历史记录
(setq emms-cache-file "~/.emacs.d/emms/cache")              ;缓存文件
;(setq emms-stream-bookmarks-file "~/MyEmacs/Configure-File/Emms/streams") ;网络电台保存文件
;(setq emms-score-file "~/MyEmacs/Configure-File/Emms/scores")             ;分数文件
(setq emms-source-file-default-directory "~/document/music")                  ;设定默认的播放目录
;; 播放设置
;(add-hook 'emms-player-finished-hook 'emms-random)   
       ;当播放完当前的歌曲时随机选择下一首歌曲

;(emms-mode-line 1)
; (emms-playing-time 1)

;(emms-playing-time-enable-display)

(setq emms-track-description-function
       'xwl-emms-info-track-description)

;; 设定 mplayer 支持的格式
(emms-player-set emms-player-mplayer 'regex
                 "\\.ogg\\|\\.mp3\\|\\.wav\\|\\.mpg\\|\\.mpeg\\|\\.wmv\\|\\.wma\\|\\.mov\\|\\.avi\\|\\.divx\\|\\.ogm\\|\\.asf;\\|\\.mkv\\|http://\\|mms://\\|\\.rm\\|\\.rmvb\\|\\.mp4\\|\\.flac\\|\\.vob\\|\\.m4a\\|\\.ape\\|\\.mpc")

 ;; global key-map
;(global-set-key (kbd "H-x") 'emms-playlist-mode-go)

;; 设定 mplayer 支持的格式
;(emms-player-set emms-player-mplayer 'regex
;                 "\\.ogg\\|\\.mp3\\|\\.wav\\|\\.mpg\\|\\.mpeg\\|\\.wmv\\|\\.wma\\|\\.mov\\|\\.avi\\|\\.divx\\|\\.ogm\\|\\.asf;\\|\\.mkv\\|http://\\|mms://\\|\\.rm\\|\\.rmvb\\|\\.mp4\\|\\.flac\\|\\.vob\\|\\.m4a\\|\\.ape\\|\\.mpc")

 ;; global key-map
;(global-set-key (kbd "H-x") 'emms-playlist-mode-go)

;(set-face-foreground 'emms-playlist-selected-face "magenta")
;; 歌词设置
;(ad-activate 'emms-lyrics-find-lyric)        ;自动下载歌词
;(setq emms-lyrics-dir my-lyrics-directory)   ;EMMS的歌词目录
;(setq emms-lyrics-display-format "%s")       ;设置歌词显示格式
;(setq emms-lyrics-scroll-timer-interval 1.0) ;歌词滚动延迟
;(setq emms-lyrics-display-on-minibuffer nil) ;在minibuffer中显示歌词
;(setq emms-lyrics-display-on-modeline nil)   ;在modeline中显示歌词
;; 解析歌手和歌名
;(add-to-list 'emms-info-functions 'kid-emms-info-simple)
;; Emms-browser


;(set-face-foreground 'emms-playlist-track-face  "green")

(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e x") 'emms-start)
(global-set-key (kbd "C-c e v") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e o") 'emms-show)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e f") 'emms-play-playlist)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e a") 'emms-add-directory-tree)

(global-set-key (kbd "C-c e r")   'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R")   'emms-toggle-repeat-playlist)

(global-set-key (kbd "C-c e s u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e s d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e s o") 'emms-score-show-playing)

;; playlist-mode-map
(define-key emms-playlist-mode-map (kbd "SPC") 'emms-pause)
(define-key emms-playlist-mode-map (kbd "+") 'emms-volume-raise)
(define-key emms-playlist-mode-map (kbd "-") 'emms-volume-lower)
(define-key emms-playlist-mode-map (kbd "<right>")
  (lambda () (interactive) (emms-seek +10)))
(define-key emms-playlist-mode-map (kbd "<left>")
  (lambda () (interactive) (emms-seek -10)))
(define-key emms-playlist-mode-map (kbd "<up>")
  (lambda () (interactive) (emms-seek +60)))
(define-key emms-playlist-mode-map (kbd "<down>")
  (lambda () (interactive) (emms-seek -60)))
(define-key emms-playlist-mode-map (kbd "S u") 'emms-score-up-file-on-line)
(define-key emms-playlist-mode-map (kbd "S d") 'emms-score-down-file-on-line)
(define-key emms-playlist-mode-map (kbd "S o") 'emms-score-show-file-on-line)
(define-key emms-playlist-mode-map (kbd "S l") 'emms-score-less-tolerant)
(define-key emms-playlist-mode-map (kbd "S m") 'emms-score-more-tolerant)
(define-key emms-playlist-mode-map (kbd "S t") 'emms-score-set-tolerance)
(define-key emms-playlist-mode-map (kbd "S s") 'emms-score-show-playing)


 (setq xwl-emms-playlist-last-track nil)
     (setq xwl-emms-playlist-last-indent "\\")
(defun xwl-emms-info-track-description (track)
  "Return a description of the current track."
  (let* ((name (emms-track-name track))
	 (type (emms-track-type track))
	 (short-name (file-name-nondirectory name))
	 (play-count (or (emms-track-get track 'play-count) 0))
	 (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
	 (empty "..."))
    (prog1
	(case (emms-track-type track)
	  ((file url)
	   (let* ((artist (or (emms-track-get track 'info-artist) empty))
		  (year (emms-track-get track 'info-year))
		  (playing-time (or (emms-track-get track 'info-playing-time) 0))
		  (min (/ playing-time 60))
		  (sec (% playing-time 60))
		  (album (or (emms-track-get track 'info-album) empty))
		  (tracknumber (emms-track-get track 'info-tracknumber))
		  (short-name (file-name-sans-extension
			       (file-name-nondirectory name)))
		  (title (or (emms-track-get track 'info-title) short-name))

		  ;; last track
		  (ltrack xwl-emms-playlist-last-track)
		  (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
			       empty))
		  (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
			      empty))

		  (same-album-p (and (not (string= lalbum empty))
				     (string= album lalbum))))
	     (format " %-20s%-50s%-32s%-8s%s"
		    ; (emms-last-played-format-date last-played)
		    ; play-count
		     artist

		     ;; Combine indention, tracknumber, title.
		     (concat
		      (if same-album-p ; indention by album
			  (setq xwl-emms-playlist-last-indent
				(concat " " xwl-emms-playlist-last-indent))
			(setq xwl-emms-playlist-last-indent "\\")
			"")
		      (if (and tracknumber ; tracknumber
			       (not (zerop (string-to-number tracknumber))))
			  (format "%02d." (string-to-number tracknumber))
			"")
		      title        ; title
		      )

		     ;; album
		     (cond ((string= album empty) empty)
			   ;; (same-album-p "  ")
			   (t (concat "《" album "》")))

		     (or year empty)
		     (if (or (> min 0)  (> sec 0))
			 (format "%02d:%02d" min sec)
		       empty))))
	  ((url)
	   (concat (symbol-name type) ":" name))
	  (t
	   (format "%-3d%s"
		   play-count
		   (concat (symbol-name type) ":" name))))
      (setq xwl-emms-playlist-last-track track))))

;; mode line format
(setq emms-playing-time-display-format "[ %s ]"
      emms-mode-line-format "%20s")
(setq global-mode-string
      '("" emms-playing-time-string " " emms-mode-line-string))


(provide 'init-emms)

;;; init-emms.el ends here
