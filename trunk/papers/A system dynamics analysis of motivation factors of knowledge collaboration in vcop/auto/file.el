(TeX-add-style-hook "file"
 (lambda ()
    (LaTeX-add-environments
     "definition")
    (LaTeX-add-labels
     "sec:introduction"
     "sec:backgr-liter-revi"
     "sec:motiv-fact-analys"
     "sec:classification-uses"
     "fig:classification"
     "sec:coll-behav-analys"
     "sec:analys-motiv-fact"
     "sec:individual-level"
     "sec:group-level"
     "sec:modeling-process"
     "fig:cause-and-effect"
     "sec:motiv-fact-model"
     "fig:senior member"
     "sec:motiv-fact-model-1"
     "fig:common-member"
     "sec:simulation-research-"
     "sec:backgr-simul-rese"
     "sec:defin-fact-wiki"
     "sec:wikipedia"
     "sec:hypoth-param-wiki"
     "sec:comp-betw-syst"
     "sec:conclusion")
    (TeX-run-style-hooks
     "booktabs"
     "subfigure"
     "algorithmic"
     "algorithm"
     "graphics"
     "hyperref"
     "multirow"
     "bigdelim"
     "amsmath"
     "amssymb"
     "latex2e"
     "elsarticle10"
     "elsarticle")))

