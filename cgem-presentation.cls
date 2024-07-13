%% CGEM Presentation Package
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgem-presentation}[2024/05/10 CGEM Presentations]

%----------------------------------------
%% CGEM Presentation Package Dependencies
\LoadClass[aspectratio=169]{beamer}

% Preamble
\RequirePackage{amsmath, amsfonts, amssymb} % Math
\RequirePackage{array} % array stretch
\RequirePackage{bm}
\RequirePackage[backend=biber, style=authoryear-comp]{biblatex} % Bibliography, change style if you prefer
\RequirePackage{fontspec} % Fonts --- If this fails to compile, try XeLaTeX or LuaTeX
\RequirePackage{hyperref} % Links
\RequirePackage{longtable} % explanation of equations table
\RequirePackage[absolute,overlay]{textpos} % Figure placement
\RequirePackage{xcolor} % Colors

%-----------------------------------------
% Linking CGEM Lua package
\directlua{ cgembib = require("bib") } 

%-----------------------------------------
%% Global TeX Settings and Options Processing

% Presentation color options
\definecolor{highlight}{HTML}{FFC000} % Highlight color
\definecolor{cgemblue}{HTML}{90C5FB} % Light CGEM blue
\definecolor{pres-blue}{HTML}{496EAF} % Darkish blue
\definecolor{pres-red}{HTML}{BD3939} % Beautiful red

% Parse the optional color argument
\DeclareOption{dark}{
  \colorlet{ZeroColor}{black}
  \colorlet{FirstColor}{white}
  \colorlet{SecondColor}{cgemblue}
  \colorlet{ThirdColor}{cgemblue!40!red}
  \newcommand{\LogoFileCGEM}{cgem-logo-dark}
  \newcommand{\LogoFileMines}{mines-logo-dark}
}
\DeclareOption{light}{
  \colorlet{ZeroColor}{white}
  \colorlet{FirstColor}{black}
  \colorlet{SecondColor}{pres-blue}
  \colorlet{ThirdColor}{pres-red}
  \newcommand{\LogoFileCGEM}{cgem-logo-light}
  \newcommand{\LogoFileMines}{mines-logo-light}
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
\setbeamertemplate{footline}{
  \begin{flushright}
    \textcolor{SecondColor}{\large \insertframenumber}
    \hspace{1mm}
    \vspace{-1mm}
  \end{flushright}
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

%-------------------------------------------
%% Bibliography Style

% Linking bibliography folder
\newcommand{\bibliographypath}[1]{ \directlua{ cgembib.make("#1") } }

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
\renewcommand*{\citesetup}{
  \color{ThirdColor}
  \biburlsetup
}

% Figure citation beneath bottom right hand corner of image, integrates with BibTeX
\newcommand{\citefig}[1]{
  \begin{flushright}
    \vspace{-4mm}
    \cite{#1}
  \end{flushright}
}

% Bibliography frame
\newcommand{\BibliographyFrame}{
  \begin{frame}[allowframebreaks,plain]{References}
    \printbibliography
  \end{frame}
}

%------------------------------------------
