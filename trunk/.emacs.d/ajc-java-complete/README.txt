;;this is auto java complete ,or another java complete !!!    
;; install 
;; first you should have installed  auto-complete 
;;then install this one for java complete 

;; then  add this lines  in .emacs

(add-to-list 'load-path (   "~/.emacs.d/ajc-java-complete") )
(require 'ajc-java-complete-config)

;;read ajc-java-complete-config  for more info .

;; run 
      javac Tags.java 
      java Tags 
   to generate the tag file ~/.java_base.tag 
   if it can't work on you computer ,use my tag file java_base.tag.bz2  bunzip
   it and 
   rename it to .java_base.tag and put it in your home directory
;"";restart your emacs ,and enjoy.


