% This is a LaTeX 2e Class file for creating LPSC abstracts

\ProvidesClass{lpsc_abstract}[2018/12/03 LPSC Abstract Class]
\NeedsTeXFormat{LaTeX2e}

% Copyright (C) 2005,2007,2008 Ross A. Beyer
% Copyright (C) 2018 Benoit Seignovert

% This work is licensed under the Creative Commons
% Attribution-Noncommercial-Share Alike 4.0 License. To view a copy
% of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/;
% or, (b) send a letter to Creative Commons, 171 2nd Street, Suite
% 300, San Francisco, California, 94105, USA.

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass[letterpaper,10pt,twocolumn,twoside]{article}

%%---------------------------- Require Package ------------------------

\RequirePackage{authblk}                 % Author affiliations
\RequirePackage{graphicx}                % Nice graphics, optional
\RequirePackage{siunitx}                 % Scientific units, optional

\RequirePackage{times}
\RequirePackage[margin=1in]{geometry}	 % Sets margins cleanly
\RequirePackage[small,compact]{titlesec} % To compress the section titles even more, use the 
\RequirePackage{paralist}			     % For compressing bibliography into a paragraph
\RequirePackage{balance}			     % For balancing columns on the page.
\RequirePackage[
    pdftex,
    colorlinks=true,
    urlcolor=blue,
    citecolor=black,
    linkcolor=black
]{hyperref} % Puts actual hyperlinks in your PDF, optional.

\RequirePackage[numbers]{natbib}

%%---------------------------- Global Settings ------------------------

%% Page Style to put numbers at the top.
\pagestyle{empty}

\setlength{\columnsep}{.4in}

\titlespacing{\paragraph}{.25in}{2pt}{.5em}
\titleformat{\subparagraph}[runin]{\normalfont\normalsize\itshape}{\thesubparagraph}{1em}{}
\titlespacing{\subparagraph}{.25in}{2pt}{.5em}


%%---------------------------- Commands ----------------
%%
%% We need to create some commands that the LPSC template will use

% Change authblk defaults
\renewcommand\Authands{ and }
\renewcommand\AB@affilsepx{, }

% Edit maketitle command
\def\@maketitle{%
    {\bfseries\MakeUppercase\@title. }%
    {\AB@authlist, \AB@affillist.}%
    \vskip .3in
}
\renewcommand\maketitle{
    \thispagestyle{empty}
    \twocolumn[\@maketitle]
}

% Put the bibliography inline
\bibliographystyle{unsrtetal}

\renewenvironment{thebibliography}[1]{%
\let\par\relax\inparaenum[{[}1{]}]}{\endinparaenum}
\let\oldbibitem\bibitem
\renewcommand{\bibitem}[1]{\item\vphantom{\oldbibitem{#1}}}
