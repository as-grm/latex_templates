\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{minimal}[2025/11/21 Dispozicija zaključnega dela na FPP]

% ******************************************************************
% !!! POMEMBNO: class je narejen za prevajanje z pdflatex ukazom !!!
% ******************************************************************

% **********************************
% *** Nalaganje dodatnih paketov *** 
% **********************************

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[slovene]{babel}
\RequirePackage{lmodern}
\RequirePackage{newfile}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\RequirePackage{makeidx}
\RequirePackage{setspace}

\RequirePackage{amsfonts,amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{tabularray}

% ******************************************************************

\SetupKeyvalOptions{family=minimal,prefix=minimal@}

\DeclareStringOption[default program]{PROGRAM}
\DeclareStringOption{SMER}
\DeclareStringOption{NASLOV}
\DeclareStringOption{AVTOR}

% ----------------------------
% Aliases for PROGRAM
% ----------------------------
\DeclareVoidOption{pomnav}{
	\renewcommand{\minimal@PROGRAM}
	{Visokošolski strokovni študijski program prve stopnje Navtika}
}

% ******************************************************************
\ProcessKeyvalOptions*
% ******************************************************************

\LoadClass[12pt,a4paper]{article}


% ******************************************************************
%                *** Izdelava PDF/A dokument ***
% ******************************************************************
%
% pdfLatex generira navaden PDF, ki ga je potrebno pretvorit v PFD/A
%
% pretvorba v PDF/A online: 
%           https://www.pdfforge.org/online/en/pdf-to-pdfa
% 
% validacija PDF/A: 
%           https://www.pdfforge.org/online/en/validate-pdfa
%
% ******************************************************************

% potrebno za izdelavo vseh hyper metapodatkov
\RequirePackage{hyperref}

% *** izdelava tesesa dokumenta ***
\AfterEndPreamble{
	
	% Doda metadata informacijo za metadata podatke v PDF/A
	\hypersetup{
		pdfauthor={\minimal@AVTOR},
		pdftitle={\minimal@NASLOV},
	}
	
	% Avoid duplicate 'page.1' by disabling page anchors on title/front matter
	\hypersetup{pageanchor=false}
	\pagenumbering{roman}


% *****************************************
% ***         start title body          ***
% *****************************************

	%\thispagestyle{empty}
	Naslov: \minimal@NASLOV\\[5mm]
	Avtor: \minimal@AVTOR\\[5mm]
	Program: \minimal@PROGRAM \\[5mm]
	\ifdefined\minimal@SMER
		\ifx\minimal@SMER\empty
			% Do nothing (it's empty)
		\else
				Smer: \minimal@SMER\\[5mm]
		\fi
	\fi


% *****************************************
% ***        start document body        ***
% *****************************************

	\clearpage
	%\cleardoublepage
	\hypersetup{pageanchor=true}% Re-enable before main content
	\pagenumbering{arabic}%
}

% -----------------------------------------------
% Bookmark package (optional but recommended)
% -----------------------------------------------
\RequirePackage{bookmark} % better outlines; fewer reruns

% ********************
% *** End of class ***
% ********************

