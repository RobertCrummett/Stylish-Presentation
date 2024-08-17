# Make CGEM poster template project
source = presentation.tex
target = presentation.pdf

all: pdf

pdf: $(target)

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
	
.PHONY: all pdf documentation clean purge
