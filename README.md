## About Stylish-Presentation
My research group, the [Center of Gravity, Electrical, and Magnetic Studies](https://cgem.mines.edu/) (CGEM) at the Colorado School of Mines, has a distinct color palette for our presentations – black background, white, and light blue text. The `Stylish-Presentation` repository contains all of the code necessary to build a [LuaTeX](https://www.luatex.org/) [Beamer](https://ctan.org/pkg/beamer?lang=en) presentation with our color theme, fonts, and logos already formatted.

My initial intent with this project was to practice my TeX coding. However, in the process of studying LaTeX, I came across a powerful dialect called [LuaTeX](https://www.luatex.org/), a TeX engine integrated with the scripting language Lua. Long story short, a weekend project turned into a weeklong project, and ultimately a spiffy and extendable `*.cls` package for CGEM research presentations.

Do you need to know LaTeX to use this package? **_Yes_** \
Do you need to know Lua to use this package? **_No_** \
To extend this package, do you need to know Lua? **_Probably_**

## Getting Started

Simply clone this repository locally on your machine and you are ready to get started.

One needs a [MikTeX](https://miktex.org/) distribution installed locally to follow the example compilation. Alternatively, this project can be compiled in Overleaf, so long as the default compiler is switched to LuaLaTeX.

To compile the presentation from the command line, run
```
latexmk -pdflatex=lualatex -pdf cgem-presentation.tex
```
This should produce a pdf of the presentation, so long as [MikTeX](https://miktex.org/) has been properly installed.

## Usage
How 
