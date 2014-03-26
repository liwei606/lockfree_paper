OTT 		= ~/Downloads/ott_distro_0.24/bin/ott

all: pdf

lang.tex lang.v: lang.ott
	ott lang.ott -o lang.tex -o lang.v

pdf: lang.tex 
	pdflatex main.tex
	bibtex main.aux
	pdflatex main.tex
	pdflatex main.tex


clean:
	rm -r *.aux *.pdf *.bbl *.log *.blg
  
coq:
	/usr/local/bin/coqc Vtac.v basis.v lang.v combine_results.v proofs.v

html:
	/usr/local/bin/coqdoc Vtac.v basis.v lang.v combine_results.v proofs.v

