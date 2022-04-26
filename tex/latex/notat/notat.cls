% Template for notat class
% Sverre Brovoll
%
% CHANGE LOG
% Version 1.0, 2020.01.07, Initial Release, Sverre Brovoll

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notat}[2020/01/07 Sverre Brovoll]
\typeout{-- loading notat.cls}

% Version number
\def\@version{1.0}

% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage


% % CONDITIONALS

% % Conditionals            (& default value)
% \newif\ifOPTvone          \OPTvonefalse
% \newif\ifOPTvlatest       \OPTvlatesttrue
% % Use XeLaTeX compiler instead of PdflLaTeX?
% \newif\ifOPTxelatex       \OPTxelatexfalse
% % Add references using Bibtex?      
% \newif\ifOPTbibtex        \OPTbibtexfalse 
% % Add references using BibLatex (better)?      
% \newif\ifOPTbiblatex      \OPTbiblatexfalse     
% % True if either of the two above is specified
% \newif\ifOPTbibliography  \OPTbibliographyfalse 

% % Remember to enable all versions prior to the one given
% \ifOPTvlatest\OPTvonetrue\fi


% PARAMETERS 

% This style file is based on the article class
\def\@bdoctype{article}

% % Send reasonable parameters to the 'article' class
\PassOptionsToClass{11pt}{\@bdoctype}
\PassOptionsToClass{a4paper}{\@bdoctype}
\PassOptionsToClass{oneside}{\@bdoctype}
\PassOptionsToClass{twoside}{\@bdoctype}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
% Process all the parameters
\ProcessOptions\relax

% Load the standard document class
\LoadClass{\@bdoctype}

% I am not sure why, but the AMS stuff must precede the fontspec package
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}

\typeout{-- PdfLaTeX specified, loading inputenc and fontenc}%
% \RequirePackage[utf8]{inputenc}%       % Set input encoding (optionally latin1)
\RequirePackage[T1]{fontenc}%          % Set font encoding
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}%
\RequirePackage{url}%
\RequirePackage{rotating}              % For rotating figures and tables
\RequirePackage{pdflscape}             % For rotating pages

% FONTS
\RequirePackage{fontspec}
\RequirePackage{titlesec}

\defaultfontfeatures{Ligatures=TeX}
\setsansfont{Calibri}
% Set serifed font to Cambria
\setmainfont{Cambria}

% Define a new fontfamily for the subsubsection font
% Don't use \fontspec directly to change the font
\newfontfamily\subsubsectionfont{Times New Roman}
% Set formats for each heading level
\titleformat*{\section}{\Large\bfseries\sffamily}
\titleformat*{\subsection}{\large\bfseries\sffamily}
\titleformat*{\subsubsection}{\itshape\subsubsectionfont}

% LAYOUT 

% Page layout:
\setlength\paperwidth{21cm}                  % As Word defines A4
\setlength\paperheight{29.7cm}               % As Word defines A4

% Margins:
% Left margin = 1 inch + hoffset + oddsidemargin (or evensidemargin)
\setlength\hoffset{0pt}
\setlength\oddsidemargin{0pt}                % Applies to all pages in one-page setups.
\setlength\evensidemargin{0pt}               % Only applies in two-page setups.
% Top margin = 1 inch + voffset + topmargin + headheight + headsep
\addtolength\voffset{-1in}
\addtolength\voffset{0.75cm}
\setlength\topmargin{0pt}
\setlength\headheight{77pt}                  % Header height
\setlength\headsep{1cm}                      % Distance between header and text
% Let's see what is left for text then...
\setlength\textwidth{\paperwidth}            % A4 width
\addtolength\textwidth{-2in}                 % Subtract margins
\setlength\linewidth{\textwidth}             % linewidth=textwidth
\setlength\textheight{\paperheight}          % A4 height
\addtolength\textheight{-\voffset}           % Subtract margins
\addtolength\textheight{-\headheight}        % Subtract margins
\addtolength\textheight{-\headsep}           % Subtract margins
\addtolength\textheight{-2in}                % Subtract margins

\newlength\lineheight
\setlength\lineheight{12pt}
\renewcommand\baselinestretch{1.15}
\AtBeginDocument{%
  \fontsize{\lineheight}{\lineheight}\selectfont%
}
\selectfont

\setlength\parindent{0pt}                     % Indentation of the first line in a paragraph
% \setlength\parskip{2}                         % Vertical distance between paragraphs. No rubber length,
                                                % but this can be specified e.g. like this:
\setlength\parskip{10pt%                      % baseskip
               plus.5\baselineskip%           % amount of stretch
               minus.3\baselineskip}          % pickyness on underfull vbox




% The footer will not be used, I guess? I'll just set some sane length here anyways
\setlength\footskip{3\baselineskip} % Distance from bottom of text to (bottom of) footer

\setlength\marginparsep{5pt}     % Space between text and margin notes
\setlength\marginparwidth{2cm}   % Margin width
\setlength\marginparpush{0pt}    % hmm, no idea.. spacings between margin notes perhaps?


% Floats (tables and figures)
\setlength\floatsep{0pt}      % space left between floats.
\setlength\textfloatsep{\baselineskip}  % space between last top float or first bottom float and the text.
\setlength\intextsep{\baselineskip}     % space left on top and bottom of an in-text float.

% Maths:
\setlength\abovedisplayskip{0pt} % space before maths
\setlength\belowdisplayskip{0pt} % space after maths
\setlength\arraycolsep{0pt}      % gap between columns of an array

% Not sure what the short-skips are for, setting them to zero too..
\setlength\abovedisplayshortskip{0pt}
\setlength\belowdisplayshortskip{0pt}

% Lists:
\setlength\topsep{0pt}     % space between first item and preceding paragraph.
\setlength\partopsep{0pt}  % extra space added to \topsep when environment starts a new paragraph.
\setlength\itemsep{0pt}    % space between successive items.

% From ccaption doc:  The actual space between the bottom of the illustration and the baseline of
% the first line of the caption is the \abovecaptionskip plus the \parskip plus the \baselineskip.
\setlength\abovecaptionskip{0pt} % Since \parskip=0pt and \baselineskip=12pt, this is ok.
\setlength\belowcaptionskip{\baselineskip}


% HEADERS 


\RequirePackage{fancyhdr}
\RequirePackage{multirow}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[L]{\small \subsubsectionfont Rev: \revision}
  \fancyhead[C]{\small \subsubsectionfont \mytitle}
  \fancyhead[R]{\small \subsubsectionfont \revdate}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0.5pt}

  \fancyfoot[L]{\small \subsubsectionfont FFI - Not for Public Release or Redistribution}
  \fancyfoot[R]{\small \thepage}
}

\fancypagestyle{empty}{
   \fancyhf{}
   \renewcommand{\headrulewidth}{0pt}
   \renewcommand{\footrulewidth}{0pt}
}




%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% REFERENCES %
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%


% \ifOPTxelatex
%    \RequirePackage[xetex]{hyperref}
% \else
%    \RequirePackage{hyperref}
% \fi

% %~~ HYPERREF ~~%
% \hypersetup{
%    breaklinks=true,                             % Break links when necessary
%  , linktocpage=true                             % Enable link to page?
%  , linkcolor=black                          % Colour of links to labels within document
%  , citecolor=black                              % Colour of links to the biliography
%  , filecolor=black                                % Colour of links to local files
%  , urlcolor=black                            % Colour of the links to external URLs
%  , colorlinks=true                              % ??
%  , plainpages=false                             % Store roman/arabic numbering differently to avoid
%                                                 % ``duplicate'' warning.
%   , final
% %  , bookmarksopen=true
% %  , bookmarksopenlevel=3
% %  , bookmarks=true
%  , bookmarksnumbered }                          % Have the bookmarks numbered.


% % Regarding that F#!!%! space between the reference heading and 'thebibliography', when the
% % below don't work (yes, I'm aware that this is a far fetch) I'm all out of ideas...
% \let\oldthebibliography=\thebibliography
% \renewenvironment{thebibliography}[1]%
% {\begin{oldthebibliography}{#1}
%    \setlength\itemsep{0pt}
%    \setlength\parskip{0pt}
%    \setlength\parsep{0pt}}
% {\end{oldthebibliography}}
% \renewcommand*{\refname}{}

% \ifOPTbiblatex
%    \RequirePackage[url=false, defernums=true]{biblatex}

%    \newcommand\printreferences[1]{{
%       % Remove the header name (we'll make it manually)
%       \defbibheading{bibheader}{}

%       % Find the excess space between heading and bibliography entries (trial and error)
%       \newlength\excess
%       \setlength\excess{\lineheight}
% %       \addtolength\excess{12pt}

%       \addcontentsline{toc}{section}{References}
%       \section*{References}\ \par\vspace{-\excess}
%       \printbibliography[heading=bibheader]
%    }}
% \fi

% \ifOPTbibtex
%       \let\oldbibliography=\bibliography

%       \renewcommand\bibliography[1]{{

%          % Remove the header name (we'll make it manually)
%          \renewcommand\refname{}

%          % Find the excess space between heading and bibliography entries (trial and error, and educated guess)
%          \newlength\excess
%          \setlength\excess{2\baselineskip}
% %          \addtolength\excess{2\lineheight}
%          \addcontentsline{toc}{section}{References}

%          \setlength\parskip{0pt}
%          \section*{References}\vspace*{-\excess}
%          \bibliographystyle{unsrt}
%          \oldbibliography{#1}
%       }}
% \fi



% % FLOATS  
% % Alter some LaTeX defaults for better treatment of figures:
%     % See p.105 of "TeX Unbound" for suggested values.
%     % See pp. 199-200 of Lamport's "LaTeX" book for details.
%     %   General parameters, for ALL pages:
%     \renewcommand{\topfraction}{0.9}  % max fraction of floats at top
%     \renewcommand{\bottomfraction}{0.8} % max fraction of floats at bottom
%     %   Parameters for TEXT pages (not float pages):
%     \setcounter{topnumber}{2}
%     \setcounter{bottomnumber}{2}
%     \setcounter{totalnumber}{4}     % 2 may work better
%     \setcounter{dbltopnumber}{2}    % for 2-column pages
%     \renewcommand{\dbltopfraction}{0.9} % fit big float above 2-col. text
%     \renewcommand{\textfraction}{0.07}  % allow minimal text w. figs
%     %   Parameters for FLOAT pages (not text pages):
%     \renewcommand{\floatpagefraction}{0.85}  % require fuller float pages
%   % N.B.: floatpagefraction MUST be less than topfraction !!
%     \renewcommand{\dblfloatpagefraction}{0.85} % require fuller float pages

%   % remember to use [htp] or [htpb] for placement

% %   \hbadness=25 %(10000=infinity - underfull hbox ignored)
% %   \vbadness=25 %correction underfull vbox ignored
% %   \hfuzz=2pt (whats the accepted line overflow?)
% %   \tolerance= (1000 - overfull hbox' ignored)


% %%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% % LISTS ETC. %
% %%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% \let\olditemize\itemize
% \let\endolditemize\enditemize
% % \let\olditem\item
% % \renewcommand\item{\olditem\hspace{-0.63cm}\parbox[t]{0.63cm}{\labelitemi}}

% % \let\olditemize\itemize
% \renewenvironment{itemize}{%
% \begin{olditemize}%
%    \setlength{\leftmargin}{1.26cm}         % From Word template
%    \setlength{\itemindent}{0pt}%.63cm}
%    \setlength{\itemsep}{\baselineskip}
%    \setlength{\parskip}{0pt}%
%    \setlength{\parsep}{0pt}%
% }%
% {\end{olditemize}}

% \let\oldenumerate\enumerate
% \let\endoldenumerate\endenumerate
% \renewenvironment{enumerate}{%
% \begin{oldenumerate}%
%    \setlength{\leftmargin}{1.26cm}         % From Word template
%    \setlength{\itemindent}{0pt}%.63cm}
%    \setlength{\itemsep}{\baselineskip}
%    \setlength{\parskip}{0pt}%
%    \setlength{\parsep}{0pt}%
% }%
% {\end{oldenumerate}}


% % \renewenvironment{enumerate}{%
% % \begin{list}{}{
% %    \setlength{\leftmargin}{1.26cm}         % From Word template
% %    \setlength{\itemindent}{0pt}%
% %    \setlength{\itemsep}{0pt}
% %    \setlength{\parskip}{0pt}%
% %    \setlength{\parsep}{0pt}}%
% %    \let\olditem\item
% %    \renewcommand\item{%
% %       \addtocounter{enumi}{1}%
% %       \olditem\hspace{-0.63cm}\parbox[t]{0.63cm}{\labelenumi}}}%
% % {\end{list}}

% \newenvironment{narrow}[2]{%
% \begin{list}{}{%
% \setlength{\topsep}{0pt}%
% \setlength{\leftmargin}{#1}%
% \setlength{\rightmargin}{#2}%
% \setlength{\listparindent}{\parindent}%
% \setlength{\itemindent}{\parindent}%
% \setlength{\parsep}{\parskip}}%
% \item[]}{\end{list}}

% %%%%%%%%%%%%%%%%%%%%%%%                         %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% % FORMATTING COMMANDS %
% %%%%%%%%%%%%%%%%%%%%%%%                        %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% %
% % \renewenvironment{narrow}[2]{
% %    \begin{list}{}{%
% %    \setlength{\topsep}{0pt}%
% %    \setlength{\leftmargin}{#1}%
% %    \setlength{\rightmargin}{#2}%
% %    \setlength{\listparindent}{\parindent}%
% %    \setlength{\itemindent}{\parindent}%
% %    \setlength{\parsep}{\parskip}}%
% %    \item[]}{\end{list}}

% %%%%%%%%%%%%%%%                                 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% % OTHER STUFF %
% %%%%%%%%%%%%%%%                                 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% %% Numbering depth
% \setcounter{tocdepth}{4}       % Depth of numbering in the TOC (1.1.1)
% \setcounter{secnumdepth}{3}    % Depth of numbering in the document (1.1.1)

% %% Define "size" of a length
% \setlength{\unitlength}{1mm}

% \fussy  % Options: fussy, sloppy
% %%
% \clubpenalty=10000
% %%
% \widowpenalty=10000
% %%
% \displaywidowpenalty=10000
% %%
% \adjdemerits=10000

% \hfuzz=1pc % Don't bother to report overfull boxes if over-edge is < 1pc
% \vfuzz=1pc % Don't bother to report overfull boxes if over-edge is < 1pc

