(TeX-add-style-hook "ch3"
 (lambda ()
    (LaTeX-add-labels
     "cha:wikipedian"
     "sec:participants"
     "sec:similarity"
     "eq:2"
     "eq:3"
     "fig:contribution"
     "text-feature"
     "eq:1"
     "sec:dataset"
     "tab:coefficient"
     "tab:model-test")
    (TeX-run-style-hooks
     "contribution")))

