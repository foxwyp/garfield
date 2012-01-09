(require 'ajc-java-complete)
;; conflect with 
;; (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; when complete constructor 
(ajc-init)
;; auto import all Class in source file    
(global-set-key (kbd "C-c i") (quote ajc-import-all-unimported-class-candidates))
;; import Class where under point 
(global-set-key (kbd "C-c m") (quote ajc-import-class-under-point-candidates))

(ac-define-source ajc-import
  '((candidates . (ajc-import-package-candidates))
 (prefix . "^[ \t]*import[ \t]+\\(.*\\)") 
) )
(ac-define-source ajc-class
  '((candidates . (ajc-complete-class-candidates ))
 (prefix . "\\b\\([A-Z][a-zA-Z0-9_]*\\)") 
   (cache)
) )

(ac-define-source ajc-constructor
  '((candidates . (ajc-complete-constructor-candidates ))
  (cache)
(prefix . "\\bnew[ \t]+\\(.*\\)") 
) )
(ac-define-source ajc-method
  '((candidates . (ajc-complete-method-candidates ))
  (cache)
; (prefix . "\\(\\..*\\)") 
  (requires . 0)
  (prefix . c-dot-ref)
) )
(ac-define-source ajc-keywords
  '((candidates . (ajc-java-keywords-candidates))
) )
(defun ajc-java-complete-hook ()
  (ajc-init-when-load-first-java-file)
    (setq ac-sources (append  '( ac-source-ajc-class ac-source-ajc-import ac-source-ajc-constructor ac-source-ajc-method  ac-source-ajc-keywords ) ac-sources))
)

(add-hook 'java-mode-hook 'ajc-java-complete-hook)
;(add-hook 'emacs-lisp-mode-hook 'ajc-java-complete-hook)
(provide 'ajc-java-complete-config)
