PDF := Jaroszynski.pdf
IMGS := cena_podczas_zamkniecia.jpg comp.jpg hist2.jpg histogram.jpg

clean:
	-rm *aux
	-rm *toc
	-rm *log
	-rm *jpg

cleanpdf:
	-rm *pdf

$(PDF): $(IMGS)
	pdflatex Jaroszynski.tex
	rm $(PDF)
	pdflatex Jaroszynski.tex

$(IMGS):
	R -f Jaroszynski.R

pdf: cleanpdf $(PDF)

img: $(IMGS)

.PHONY: clean img pdf
