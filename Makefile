# Make CGEM poster template project
source = presentation.tex
target = presentation.pdf

pdf: $(target)

all: pdf

doc: $(target)
	magick -density 300 $< -quality 90 example.png

$(target): $(source) cgem-presentation.cls bib.lua
	latexmk -pdflua $<

clean:
	rm -f Doc/*
	latexmk -C -f $(target)

purge: clean
	rm -f Bib/*
	rm -f Figure/*
	rm README.markdown
	
.PHONY: all pdf doc clean purge
