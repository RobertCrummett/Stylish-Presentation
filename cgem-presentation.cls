%% CGEM Presentation Package
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgem-presentation}[2024/05/10 CGEM Presentations]

%----------------------------------------
%% CGEM Presentation Package Dependencies
\LoadClass[aspectratio=169]{beamer}

% Preamble
\RequirePackage{amsmath, amsfonts, amssymb} % Math
\RequirePackage{array} % array stretch
\RequirePackage[backend=biber, style=authoryear-comp]{biblatex} % Bibliography, change style if you prefer
\RequirePackage{fontspec} % Fonts --- If this fails to compile, try XeLaTeX or LuaTeX
\RequirePackage{graphicx} % Figures
\RequirePackage{hyperref} % Links
\RequirePackage{longtable} % explanation of equations table
\RequirePackage[absolute,overlay]{textpos} % Figure placement
\RequirePackage{xcolor} % Colors

%-----------------------------------------
% Linking CGEM Lua package
\directlua{ cgem = require("cgem-presentation") } 

%-----------------------------------------
%% Global TeX Settings and Options Processing

% Presentation color options
\definecolor{highlight}{HTML}{FFC000} % Highlight color
\definecolor{cgemblue}{HTML}{90C5FB} % Light CGEM blue

\DeclareOption{dark}{
  \colorlet{ZeroColor}{black}
  \colorlet{FirstColor}{white}
  \colorlet{SecondColor}{cgemblue}
  \colorlet{ThirdColor}{cgemblue!40!red}
  \newcommand{\cgemLogoFile}{cgem-logo-dark}
  \newcommand{\minesLogoFile}{mines-logo-dark}
}
\DeclareOption{light}{
  \colorlet{ZeroColor}{white}
  \colorlet{FirstColor}{black}
  \colorlet{SecondColor}{blue}
  \colorlet{ThirdColor}{red}
  \newcommand{\cgemLogoFile}{cgem-logo-light}
  \newcommand{\minesLogoFile}{mines-logo-light}
}
\ProcessOptions\relax

% Font Settings
\setsansfont{Arial}

% Hyperlink settings
\hypersetup{
  colorlinks=true,
  citecolor=ThirdColor,
  linkcolor=SecondColor,
  urlcolor=ThirdColor,
} % Link to corresponding author

% Background and default text color
\setbeamercolor{background canvas}{bg = ZeroColor}
\setbeamercolor{normal text}{fg = FirstColor}\usebeamercolor*{normal text}

% Turn off Beamer navigation buttons
\setbeamertemplate{navigation symbols}{}

% Page numbering
\setbeamertemplate{footline}
{
  \begin{flushright}
    \textcolor{SecondColor}{\large \insertframenumber}
    \hspace{1mm}
    \vspace{-1mm}
  \end{flushright}
}

%------------------------------------------
%% Title page 

% Title
\renewcommand{\title}[1]{ \directlua{ cgem.title.set("title", "#1") } }

% Slide authors
\renewcommand{\author}[1]{
  \directlua{ cgem.authors.set("title", "#1") }
  \directlua{ cgem.authors.set("question", "#1") }
}

% Affiliations line
\newcommand{\affiliations}[2]
{
  \directlua{ cgem.affiliations.set("title", "#1") }
  \directlua{ cgem.affiliations.set("question", "#2") }
}

% Meeting information, date, session #, etc
\newcommand{\meeting}[1]{\directlua{ cgem.meetingInfo.set("title", "#1") } }

% Autho contact information
\newcommand{\contactInfo}[1]{ \directlua{ cgem.contact.set("#1") } }

% Create new title, arguments control spacing of different sections on frame
% if you desire th change text size, color, linespacing etc, you will need to
% track them down in the Lua directory!
\renewcommand{\maketitle}[4]
{
  \begin{center}
    { \Huge \directlua{ cgem.title.print("title") }} \\ [#1]
    \textcolor{SecondColor}{
      \LARGE
      \directlua{ cgem.authors.print("title") }
    } \\ [#2]
    \textit{
      \textcolor{SecondColor}{ \directlua{ cgem.affiliations.print("title") } } \\ [#3]
      \normalsize
      \directlua{ cgem.meetingInfo.print("title") } \\ [#4]
    }
  \end{center}
}

%------------------------------------------
%% Enumeration / Itemize  / List Settings, ie, Bullet Point Lists

% Base level
\setbeamertemplate{enumerate item}{\LARGE \color{SecondColor} \textbullet}
\setbeamerfont*{itemize/enumerate body}{size=\LARGE}
\setbeamercolor{itemize/enumerate body}{fg=SecondColor}

% First Level
\setbeamertemplate{enumerate subitem}{\Large \color{FirstColor} --}
\setbeamerfont*{itemize/enumerate subbody}{size=\Large}
\setbeamercolor{itemize/enumerate subbody}{fg=FirstColor}

% Second Level -- only use in emergencies!!
\setbeamertemplate{enumerate subsubitem}{\large \color{SecondColor} \textbullet}
\setbeamerfont*{itemize/enumerate subsubbody}{size=\large}
\setbeamercolor{itemize/enumerate subsubbody}{fg=SecondColor}

%------------------------------------------
%% Frame title format

% Frame titles centers, Huge and white by default
\setbeamertemplate{frametitle}[default][center]
\setbeamerfont*{frametitle}{size=\Huge}
\setbeamercolor{frametitle}{fg=FirstColor}

%------------------------------------------
%% Question Slide

% Print a horizontal while bar across the text width of frame
\newcommand{\HorizontalBar}[1]{ \textcolor{#1}{\noindent \makebox[\linewidth]{\rule{\textwidth}{0.7pt}}} }

\newcommand{\makequestion}[5]
{
  \begin{center}
    \vspace{#1} 
    \textcolor{SecondColor}{
      \directlua{ cgem.affiliations.print("question") }
    } \\ [#2]
    \HorizontalBar{FirstColor} \\ [#3]
    \LARGE
    \textcolor{SecondColor}{
      Thank You \\
      Questions?
    } \\ [#4]
    \HorizontalBar{FirstColor} \\ [#5]
    \color{SecondColor}
    \small
    \directlua{ cgem.authors.print("question") }
  \end{center}
}

%-------------------------------------------
%% Bibliography Style

% Linking bibliography folder
\newcommand{\bibliographypath}[1]{ \directlua{ bib.make("#1") } }

% Biblography colors
\setbeamercolor*{bibliography entry title}{fg=FirstColor}
\setbeamercolor*{bibliography entry location}{fg=FirstColor}
\setbeamercolor*{bibliography entry note}{fg=FirstColor}
\setbeamercolor*{bibliography entry author}{fg=FirstColor}
\setbeamercolor*{bibliography item}{fg=SecondColor}

% No numbering on continued reference slides
\setbeamertemplate{frametitle continuation}{}

%--------------------------------------------
%% Citations

% Inline citation settings
\renewcommand*{\citesetup}
{
  \itshape
  \color{ThirdColor}
  \small
  \biburlsetup
}

% Figure citation beneath bottom right hand corner of image, integrates with BibTeX
\newcommand{\citefig}[1]
{
  \begin{flushright}
    \vspace{-4mm}
    \cite{#1}
  \end{flushright}
}

% Bibliography frame
\newcommand{\BibliographyFrame}
{
  \begin{frame}[allowframebreaks, plain]{References}
    \printbibliography
  \end{frame}
}

%--------------------------------------------
%% Variables & Explanation of Equations

% Log variables
\newcommand{\logvar}[4]{ \directlua{ cgem.variable.log("#1", "#2", "#3", "#4") } }

% Variable table frame
\newcolumntype{x}[1]{>{\centering\arraybackslash\hspace{0pt}}p{#1}}
\newcommand{\VariableFrame}
{
  \begin{frame}[allowframebreaks, plain]
    \LARGE
    \textcolor{SecondColor}{Explanation of Equations} \\
    \vspace{-1mm}
    \Large
    \renewcommand*{\arraystretch}{1.2}
    \begin{longtable}{x{1cm}|x{10cm}|x{2cm}}
      \hline && \\[-5mm]
      \directlua{ cgem.variable.print() }
    \end{longtable}
  \end{frame} 
}

%------------------------------------------
