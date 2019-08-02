\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{upa-tesis}[2018/11/21 UPA thesis LaTeX class]

\newcommand{\headlinecolor}{\normalcolor}

% Loading Clase
\LoadClass[12pt,a4paper,twoside]{article}

% Encoding
\RequirePackage[utf8]{inputenc}

% Headers Packages
\RequirePackage{fancyhdr}

% Page size and margins
\textheight=23cm
\textwidth=18.5cm
\topmargin=-2cm
\oddsidemargin=-1cm
\parindent=0mm
\usepackage[papersize={210mm,297mm},tmargin=25mm,bmargin=25mm,lmargin=25mm,rmargin=25mm]{geometry}

% Language
\RequirePackage[spanish,es-tabla]{babel}

% Figures and Color Packages
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\renewcommand{\figurename}{Figura :}

% Caption Packages
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup[figure]{labelfont={bf},name={Figura },labelsep=colon}
\captionsetup[table]{labelfont={bf},name={Tabla },labelsep=colon}

% Table Packages
\RequirePackage{booktabs}		
\RequirePackage{bigstrut}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{array}

% Math Packages
\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{enumerate}
\RequirePackage{mathrsfs}

% Links and url
\RequirePackage[colorlinks=true,linkcolor=blue,breaklinks]{hyperref}
\hypersetup{citecolor=blue}
\RequirePackage{hypcap}
\RequirePackage{url}
\RequirePackage[hyphenbreaks]{breakurl}
\def\UrlBigBreaks{\do\/\do-} 

% Chapters, sections and subsections
\RequirePackage{titlesec}
\setcounter{secnumdepth}{5} 
\setcounter{tocdepth}{5}
\titleformat{\paragraph}
{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\RequirePackage{tocloft}
  \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
  \renewcommand{\cfttoctitlefont}{\hfill\Large\bfseries}
  \renewcommand{\cftaftertoctitle}{\hfill\hfill}
\makeatletter
\renewcommand\section{\secdef\@section\@ssection}
\def\@section[#1]#2{%
  \ifnum \c@secnumdepth >\@ne
    \refstepcounter{section}%
    \typeout{\sectionname\space\thesection.}%
    \addcontentsline{toc}{section}%
                    {\sectionname\space\thesection.\space\protect#1}%
  \else
    \addcontentsline{toc}{section}{#1}%
  \fi
  \sectionmark{#1}%
  \if@twocolumn
    \@topnewpage[\@makesectionhead{#2}]%
  \else
    \@makesectionhead{#2}%
    \@afterheading
  \fi}
\def\@makesectionhead#1{%
  \vspace*{7\p@}%
  {\parindent \z@ \centering \Huge
    \ifnum \c@secnumdepth >\@ne
      \interlinepenalty\@M
      \Huge\bfseries \sectionname\space \thesection #1\par\nobreak
    \fi
    \vskip 7\p@}}%
\def\@ssection#1{%
  \if@twocolumn
    \@topnewpage[\@makessectionhead{#1}]%
  \else
    \@makessectionhead{#1}%
    \@afterheading
  \fi}%
\def\@makessectionhead#1{%
  \vspace*{7\p@}%
  {\parindent \z@ \centering\LARGE
    \interlinepenalty\@M
    \LARGE \bfseries  #1\par\nobreak
    \vskip 7\p@}}%
\def\sectionname{Section}
\def\subsectionname{Subsection}
\renewcommand{\sectionname}{Cap{\'i}tulo}
\makeatother
\RequirePackage[nottoc]{tocbibind}
\pagenumbering{roman}
\RequirePackage[noprefix]{nomencl}
\renewcommand{\nomname}{\Huge{Lista de s{\'i}mbolos}}
\makenomenclature
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}
\titleformat*{\subsection}{\LARGE\bfseries}
\titleformat*{\subsubsection}{\Large\bfseries}
\titleformat*{\paragraph}{\large\bfseries}
\titleformat*{\subparagraph}{\normalsize\bfseries}
\newcommand{\nomunit}[1]{%
\renewcommand{\nomentryend}{\hspace*{\fill}#1}}
\renewcommand{\nomlabel}[1]{\hfil #1\hfil}
\renewcommand{\labelitemi}{$\diamond$}
\RequirePackage{setspace}
\onehalfspacing
\setlength{\parindent}{2em}
\setlength{\parskip}{2em}

% https://en.wikibooks.org/wiki/LaTeX/Customizing_Page_Headers_and_Footers
% See specially: Standard page styles >> There are special commands containing details on the running page of the document
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\subsectionmark}[1]{}
 
 % Normal format
\fancyhf{}
\fancyhead[ER,OR]{\textbf{\thepage}} % Alone page
\fancyhead[EL]{\nouppercase{\textbf{\sectionname\space\leftmark}}} % Even page
\fancyhead[OL]{\nouppercase{\textbf{\space\rightmark}}} % Odd page

% Plain fomat
\fancypagestyle{myplain}
{
  \fancyhf{}
  \renewcommand\headrulewidth{0pt}
  \renewcommand\footrulewidth{0pt}
  \fancyfoot[C]{\textbf{\thepage}}
}

% Appendix format
\fancypagestyle{myFancyAppendix}
{
  \fancyhf{}
  \fancyhead[ER,OR]{\textbf{\thepage}}
}

\RequirePackage[toc,page]{appendix}
\addto\captionsspanish{%
  \renewcommand\appendixname{Ap{\'e}ndices}
  \renewcommand\appendixpagename{\centering \Huge Ap{\'e}ndices}
  \renewcommand\appendixtocname{Ap{\'e}ndices}
}

% Various
\RequirePackage{gensymb}
\RequirePackage[version=3]{mhchem}
\RequirePackage{rotating}
\RequirePackage{listings}
\RequirePackage{enumerate}

% Bibliography packages and formatting
\bibliographystyle{newapa}
\RequirePackage[round]{natbib}
\setlength{\bibsep}{.55cm}
\setlength{\bibhang}{.9cm}
\addto{\captionsspanish}{\renewcommand{\refname}{\centering \Huge Referencias bibliogr{\'a}ficas}}
\settocbibname{Referencias bibliogr{\'a}ficas}
\addto{\captionsspanish}{\renewcommand{\refname}{\centering \Huge Referencias bibliogr{\'a}ficas}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% REDIFINIG ABSOLUTE VALUE AND NORM
\DeclarePairedDelimiter\abs{\lvert}{\rvert}%
\DeclarePairedDelimiter\norm{\lVert}{\rVert}%
% Swap the definition of \abs* and \norm*, so that \abs
% and \norm resizes the size of the brackets, and the 
% starred version does not.
\makeatletter
\let\oldabs\abs
\def\abs{\@ifstar{\oldabs}{\oldabs*}}
%
\let\oldnorm\norm
\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}
\makeatother

% AVOIDING INDENTATION 
\newlength\tindent
\setlength{\tindent}{\parindent}
\setlength{\parindent}{0pt}
\renewcommand{\indent}{\hspace*{\tindent}}

% EDITING AND FORMATTING TOC AND LOF
\addtocontents{toc}{~\hfill\textbf{P{\'a}gina}\par} % putting the word page above the page numbering
\addtocontents{lof}{~\hfill\textbf{P{\'a}gina}\par}  % putting the word page above the page numbering
\addtocontents{lot}{~\hfill\textbf{P{\'a}gina}\par}  % putting the word page above the page numbering

% LISTING PACKAGE AND OPTIONS

\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\definecolor{lightYellow}{rgb}{1.00, 1.00, 0.90}

\lstset{ %
  backgroundcolor=\color{lightYellow},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}
  basicstyle=\ttfamily\small,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,           % sets automatic line breaking
  captionpos=false,                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},    % comment style
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,	                   % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  language=Matlab,                 % the language of the code
  otherkeywords={...,off},           % if you want to add more keywords to the set
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=0,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{mymauve},     % string literal style
  tabsize=2,	                   % sets default tabsize to 2 spaces
  title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}