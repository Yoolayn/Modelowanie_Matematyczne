PDF := Jaroszynski.pdf
IMGS := cena_podczas_zamkniecia.jpg comp.jpg hist2.jpg histogram.jpg

clean:
	-rm *aux
	-rm *log
	-rm *jpg

$(PDF): $(IMGS)
	pdflatex Jaroszynski.tex

$(IMGS):
	R -f Jaroszynski.R

pdf: $(PDF)

img: $(IMGS)

.PHONY: clean
