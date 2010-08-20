(TeX-add-style-hook "ch3"
 (lambda ()
    (LaTeX-add-labels
     "cha:wikipedian"
     "sec:participants"
     "sec:similarity"
     "eq:2"
     "eq:3"
     "fig:contribution")
    (TeX-run-style-hooks
     "contribution")))

