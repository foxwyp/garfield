(TeX-add-style-hook "ch3"
 (lambda ()
    (LaTeX-add-labels
     "cha:wikipedian"
     "sec:participants"
     "fig:contribution")
    (TeX-run-style-hooks
     "contribution")))

