(TeX-add-style-hook "file"
 (lambda ()
    (LaTeX-add-bibliographies
     "../../bibtex/elsevier"
     "../../bibtex/emerald"
     "../../bibtex/chinese"
     "../../bibtex/jstor"
     "../../bibtex/citeseer"
     "../../bibtex/acm"
     "../../bibtex/wiley"
     "../../bibtex/book"
     "../../bibtex/thesis"
     "../../bibtex/ebsco"
     "../../bibtex/old"
     "../../bibtex/ieee"
     "../../bibtex/internet"
     "../../bibtex/ssrn"
     "../../bibtex/apa"
     "../../bibtex/blackwell"
     "../../bibtex/sage"
     "../../bibtex/springer"
     "../../bibtex/MESharp"
     "../../bibtex/taylor")
    (LaTeX-add-environments
     "definition")
    (TeX-run-style-hooks
     "algorithmic"
     "algorithm"
     "graphics"
     "hyperref"
     "amssymb"
     "latex2e"
     "elsarticle10"
     "elsarticle")))

