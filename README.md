## About Stylish-Presentation
My research group, the [Center of Gravity, Electrical, and Magnetic Studies](https://cgem.mines.edu/) (CGEM) at the Colorado School of Mines, has a distinct color palette for our presentations – black background, white, and light blue text. The `Stylish-Presentation` repository contains all of the code necessary to build a [LuaTeX](https://www.luatex.org/) [Beamer](https://ctan.org/pkg/beamer?lang=en) presentation with our color theme, fonts, and logos already formatted.

My initial intent with this project was to practice my TeX coding. However, in the process of studying LaTeX, I came across a powerful dialect called [LuaTeX](https://www.luatex.org/), a TeX engine integrated with the scripting language Lua. Long story short, a weekend project turned into a weeklong project, and ultimately a spiffy and extendable `*.cls` package for CGEM research presentations.

Do you need to know LaTeX to use this package? **_Yes_** \
Do you need to know Lua to use this package? **_No_** \
To extend this package, do you need to know Lua? **_Probably_**

## Getting Started

Simply clone this repository locally on your machine and you are ready to get started.

One needs a [MikTeX](https://miktex.org/) distribution installed locally to follow the example compilation. Alternatively, this project can be compiled in [Overleaf](https://www.bing.com/ck/a?!&&p=22d6031c72c36c1aJmltdHM9MTcxODE1MDQwMCZpZ3VpZD0xZjkyN2YwZi00YjkyLTZhYjctMGU0MC02YjkzNGExNjZiZTEmaW5zaWQ9NTIxMQ&ptn=3&ver=2&hsh=3&fclid=1f927f0f-4b92-6ab7-0e40-6b934a166be1&psq=overleaf&u=a1aHR0cHM6Ly93d3cub3ZlcmxlYWYuY29tLw&ntb=1), so long as the default compiler is switched to LuaLaTeX.

To compile the presentation from the command line, run
```
latexmk -pdflatex=lualatex -pdf presentation-template.tex
```
This should produce a `presentation-template.pdf` of the presentation, so long as [MikTeX](https://miktex.org/) has been properly installed.

## Usage
### Preamble
The first line of the preamble is always the document class. 
```latex
\documentclass[dark]{cgem-presentation}
```
`Stylish-Presentation` provides a custom wrapper class `cgem-presentation` around the standard `beamer` class type. The class can either be run in `dark` mode (as in the example) or `light` mode. This flag automatically configures the default colors throughout the presentation, and makes it easy to produce slides in multiple color themes. The flag does not influence the background color of figures.
- [ ] **TODO** Make themes easier to extend
- [ ] **TODO** Add colorblind theme

The class should import most of tha packages you regularly use by default. If you would like a package that is not provided by default, simply add a usepackage command here.

The preamble should contain links to the Figure and bibliography directories as well. These directories can be located anywhere on the system.
```latex
% Default figure directories
\graphicspath{{./Figure}{./Logo}} % More directories can be added!

% Default bibliography directory
\bibliographypath{Bib}
```
Finally, one has the ability to semi-automatically format the title and question slides. 
```latex
%% Title
% Affilations, Meeting information, etc
\newcommand{\cgemTitle}{Center for Gravity, Electrical \\& Magnetic Studies (CGEM)}
\newcommand{\csmTitle}{Department of Geophysics --- Colorado School of Mines}
\newcommand{\meetingTitle}{Conference --- Meeting Name --- Location}
\newcommand{\sessionTitle}{Session Information (if available)}
\newcommand{\daytimeTitle}{Date --- Time}
\newcommand{\cgemQuestion}{Center for Gravity, Electrical \\& Magnetic Studies}
\newcommand{\csmQuestion}{Colorado School of Mines}

% Title frame specifications
\title{Do Not Read Title to Audience}
\author{R. Nate Crummett*;Yaoguo Li}
\affiliations{\cgemTitle;\csmTitle}{\cgemQuestion;\csmQuestion}
\meeting{\meetingTitle;\sessionTitle;\daytimeTitle}
\contactInfo{robert\\_crummett@mines.com}
```
The title and question slides are so common that I figured it is natural to abstract away some of the boilerplate necessary to create them. Lua does the hard work in the background, while we can spin the dials with LaTeX. To display the settings passed here, one merely calls 
```latex
\maketitle{}{}{}{}
```
and / or
```latex
\makequestion{}{}{}{}{}
```
within the body of the presentation.

### Document Body
- [ ] **TODO** Finish details in preamble section
- [ ] **TODO** Start Document body README.md section
