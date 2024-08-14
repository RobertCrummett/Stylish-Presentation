# Make CGEM poster template project
source = presentation-template.tex
target = preesntation-template.pdf

all: pdf

documentation: Doc/example.png

pdf: $(target)

Doc/example.png: $(target)
	magick -density 300 $< -quality 90 $@

$(target): $(source) cgem-presentation.cls bib.lua
	latexmk -pdflua $<

clean:
	rm -f Doc/*
	latexmk -C $(target)

.PHONY: all pdf documentation clean
