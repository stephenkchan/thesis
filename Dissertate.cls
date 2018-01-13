% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------
%\usepackage{RFLI_note-defs}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%
% Options
%
\RequirePackage{etoolbox}

\usepackage{xeCJK}
\setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STSong}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{cancel}
\usepackage{siunitx}
\usepackage{pdflscape}
\usepackage{multirow}
\usepackage{verbatim}
\usepackage{amssymb,amsmath,amsfonts,mathrsfs}
\usepackage{mathtools}
%\usepackage[font=tiny]{caption}
\usepackage{subcaption}
\usepackage{textpos}
\usepackage{xcolor}
\usepackage{lineno}
\linenumbers
% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[width=5.75in, letterpaper]{geometry}
\usepackage{ragged2e}
\RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
%\setmathrm{EB Garamond}
\setmathsfont(Digits,Latin)[Numbers={Proportional}]{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[super,comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{Harvard University}
\universitycity{Cambridge}
\universitystate{Massachusetts}

% School color found from university's graphic identity site:
% http://isites.harvard.edu/icb/icb.do?keyword=k75408&pageid=icb.page392732
\definecolor{SchoolColor}{rgb}{0.6471, 0.1098, 0.1882} % Crimson
\definecolor{chaptergrey}{rgb}{0.6471, 0.1098, 0.1882} % for chapter numbers

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
	\input{frontmatter/personalize}
	\maketitle
	\copyrightpage
	\abstractpage
    \contentspage
	% \listoffigures % optional
	\dedicationpage
	\acknowledgments
}

\renewcommand{\maketitle}{
    \pagenumbering{roman}
    \setcounter{page}{1}
	\thispagestyle{empty}
	\vspace*{\fill}
	\vspace{100pt}
	\begin{center}
	\Huge \textcolor{SchoolColor}{\thetitle} \normalsize \\
	\vspace{100pt}
	\textsc{a dissertation presented \\ by\\
	\theauthor\\ to\\ The Department of \@department\\
	\vspace{12pt}
	in partial fulfillment of the requirements\\
	for the degree of\\ \@degree\\
	in the subject of\\ \@field\\
	\vspace{12pt}
	\@university\\ \@universitycity, \@universitystate\\
	\@degreemonth\ \@degreeyear}
	\end{center} \vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\scshape \noindent \small \copyright \small 2017\hspace{3pt}-- \theauthor \\
	\noindent all rights reserved.
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\abstractpage}{
    \pdfbookmark{Abstract}{Abstract}
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{Thesis advisor: Professor \@advisor} \rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
    	\Large \textcolor{SchoolColor}{\@title} \normalsize \\
    	\vspace*{20pt}
    	\scshape Abstract \\ \rm
	\end{center}
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/abstract}
    \end{spacing}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\contentspage}{
    \pdfbookmark{\contentsname}{Contents}
    \tableofcontents
}

\newcommand{\dedicationpage}{
    \cleardoublepage
    \phantomsection
    \pdfbookmark{Dedication}{Dedication}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
    \cleardoublepage
}

\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/thanks}
    \end{spacing}
	\vspace*{\fill} \newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}


\renewcommand{\backmatter}{
    \begin{appendices}
        \include{chapters/mmt}
        \include{chapters/teljet2}
        \include{chapters/aec}
    \end{appendices}
    \input{endmatter/personalize}
    \clearpage
    \begin{spacing}{\dcompressedspacing}
        \bibliography{references}
        \addcontentsline{toc}{chapter}{References}
        \bibliographystyle{apalike2}
        %\include{endmatter/colophon}
    \end{spacing}
}

\def\LUMI{36.1 fb\ensuremath{^{-1}}}
\def\fb{fb\ensuremath{^{-1}}}
\def\vecmet {\ensuremath{\vec{E}^{\mathrm{miss}}_{\mathrm{T}}}}
\def\vecmpt {\ensuremath{\vec{p}_{\mathrm{T}}^{\mathrm{\ miss}}}}
\def\Et{\ensuremath{E_{\mathrm{T}}}}
\def\mpt {\ensuremath{p_{\mathrm{T}}^{\mathrm{\ miss}}}}
\def\ptv {\ensuremath{p_{\mathrm{T}}^{\mathrm{V}}}}
\def\mbb{\ensuremath{m_{bb}}}
\def\mh{\ensuremath{m_{h}}}
\def\nj{\ensuremath{n_{jet}}}
\def\mH{\ensuremath{m_{H}}}
\def\mA{\ensuremath{m_{A}}}
\def\tt{\ensuremath{t\bar{t}}}
\def\mll{\ensuremath{m_{\ell\ell}}}
\def\mT{\ensuremath{m_{T}}}
\def\mTW{\ensuremath{m_{\text{T}}^{W}}}
\def\meff{\ensuremath{m_{\textrm{eff}}}}
\def\Vh{\ensuremath{Vh}}
\def\Zh{\ensuremath{Zh}}
\def\ZH{\ensuremath{ZH\to\ell\ell b\bar{b}}}
\def\vhbb{\ensuremath{VH\left(b\bar{b}\right)}}
\def\Wh{\ensuremath{Wh}}
\def\mVh{\ensuremath{m_{\Vh}}}
\newcommand{\ptx}[1]{\ensuremath{p_{\text{T}}^{\text{#1}}}\ }
\def\VHloose{VH-loose} % should be Vh?
\def\ZHsignal{ZH-signal} % should be Vh?
\def\WHsignal{WH-signal} % should be Vh?
\def\ptmiss{\ensuremath{E^{\mathrm{miss}}_\textrm{T, trk}}}
\def\sumpt{\ensuremath{S_\textrm{T}}}
\def\to{\ensuremath{\rightarrow}}
\def\drbb{\ensuremath{\Delta R\left(b_1,b_2\right)}}
\def\dR{\ensuremath{\Delta R}}
\def\vv{\ensuremath{VV}}
\def\pT{\ensuremath{p_T}}
\def\ephi{\ensuremath{\eta-\phi}}
\def\aeta{\ensuremath{\left|\eta\right|}}
\def\mindphi{\ensuremath{|\text{min}\Delta\phi(\met,\text{jet})|}}
\def\TeV{\ifmmode {\mathrm{\ Te\kern -0.1em V}}\else
                   \textrm{Te\kern -0.1em V}\fi}%
\def\GeV{\ifmmode {\mathrm{\ Ge\kern -0.1em V}}\else
                   \textrm{Ge\kern -0.1em V}\fi}%
\def\MeV{\ifmmode {\mathrm{\ Me\kern -0.1em V}}\else
                   \textrm{Me\kern -0.1em V}\fi}%
\def\keV{\ifmmode {\mathrm{\ ke\kern -0.1em V}}\else
                   \textrm{ke\kern -0.1em V}\fi}%
\def\eV{\ifmmode  {\mathrm{\ e\kern -0.1em V}}\else
                   \textrm{e\kern -0.1em V}\fi}%
\let\tev=\TeV
\let\gev=\GeV
\let\mev=\MeV
\let\kev=\keV
\let\ev=\eV
\let\met=\vecmet
\def\powheg{\textsc{Powheg}}
\def\pythia{\textsc{Pythia}}
\def\herwig{\textsc{Herwig}}
\def\sherpa{\textsc{Sherpa}}
\def\mg{\textsc{MadGraph5}}
\let\PYTHIA=\pythia
\let\POWHEG=\powheg
\let\HERWIG=\herwig
\let\SHERPA=\sherpa
\let\lumi=\LUMI
\let\pt=\pT
\newcommand\Vhtobb{$V(H \to b\bar{b}$)\ }
\newcommand\Zhtollbb{$ZH \to \ell^+\ell^- b\bar{b}$\ }
\newcommand\Zhtovvbb{$ZH \to \nu\bar{\nu} b\bar{b}$\ }
\newcommand\Whtolvbb{$WH \to \ell \nu b\bar{b}$\ }
\newcommand\ZZtollbb{$ZZ \to \ell^+\ell^- b\bar{b}$\ }
\newcommand\ZZtovvbb{$ZZ \to \nu\bar{\nu} b\bar{b}$\ }
\newcommand\WZtolvbb{$WZ \to \ell \nu b\bar{b}$\ }
