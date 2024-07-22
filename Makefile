# Make CGEM poster template project
.PHONY: all pdf documentation

all: pdf documentation

documentation: Doc/example.png

pdf: presentation-template.pdf

Doc/example.png: presentation-template.pdf
	magick -density 300 $< -quality 90 $@

presentation-template.pdf: presentation-template.tex cgem-presentation.cls bib.lua
	latexmk -pdflua $<
