%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IST Thesis                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{istthesis}[2024/03/08 v0.1 IST Thesis]

\RequirePackage{iftex}
\RequireLuaTeX

%-------------------------------------------------------------------------------
% Class options
%-------------------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=ist, prefix=ist@}

\DeclareBoolOption[false]{portuguese}
\DeclareComplementaryOption{english}{portuguese}

\DeclareBoolOption[false]{overridefont}
\DeclareBoolOption[false]{showoverfull}

\ProcessKeyvalOptions*

%-------------------------------------------------------------------------------
% Load report class
%-------------------------------------------------------------------------------
\LoadClass[a4paper,twoside,10pt]{report}

%-------------------------------------------------------------------------------
% Metadata
%-------------------------------------------------------------------------------
\newcommand*{\ist@emptycommand}{}

\newcommand*{\ist@thetitle}{@title}
\newcommand*{\thetitle}{\ist@thetitle}
\RenewDocumentCommand{\title}{m}{\renewcommand*{\ist@thetitle}{#1}}

\newcommand*{\ist@thesubtitle}{}
\newcommand*{\thesubtitle}{\ist@thesubtitle}
\NewDocumentCommand{\subtitle}{m}{\renewcommand*{\ist@thesubtitle}{#1}}

\newcommand*{\ist@theauthor}{@author}
\newcommand*{\theauthor}{\ist@theauthor}
\RenewDocumentCommand{\author}{m}{\renewcommand*{\ist@theauthor}{#1}}

\newcommand*{\ist@thecourse}{@degree}
\newcommand*{\thecourse}{\ist@thecourse}
\NewDocumentCommand{\course}{m}{\renewcommand*{\ist@thecourse}{#1}}

\newcommand*{\ist@thesubject}{@subject}
\newcommand*{\thesubject}{\ist@thesubject}
\NewDocumentCommand{\subject}{m}{\renewcommand*{\ist@thesubject}{#1}}

\newcommand*{\ist@thekeywordsen}{@keywordsen}
\newcommand*{\thekeywordsen}{\ist@thekeywordsen}
\NewDocumentCommand{\keywordsen}{m}{\renewcommand*{\ist@thekeywordsen}{#1}}

\newcommand*{\ist@thekeywordspt}{@keywordspt}
\newcommand*{\thekeywordspt}{\ist@thekeywordspt}
\NewDocumentCommand{\keywordspt}{m}{\renewcommand*{\ist@thekeywordspt}{#1}}

\newcommand*{\ist@theuniversity}{@university}
\newcommand*{\theuniversity}{\ist@theuniversity}
\NewDocumentCommand{\university}{m}{\renewcommand*{\ist@theuniversity}{#1}}

\newcommand*{\ist@thefaculty}{@faculty}
\newcommand*{\thefaculty}{\ist@thefaculty}
\NewDocumentCommand{\faculty}{m}{\renewcommand*{\ist@thefaculty}{#1}}

\newcommand*{\ist@thefacultylogo}{example-image-golden}
\newcommand*{\thefacultylogo}{\ist@thefacultylogo}
\NewDocumentCommand{\facultylogo}{m}{\renewcommand*{\ist@thefacultylogo}{#1}}

\newcommand*{\ist@thecoverpage}{}
\newcommand*{\thecoverpage}{\ist@thecoverpage}
\NewDocumentCommand{\coverpage}{m}{\renewcommand*{\ist@thecoverpage}{#1}}

\newcommand*{\ist@thedepartment}{@department}
\newcommand*{\thedepartment}{\ist@thedepartment}
\NewDocumentCommand{\department}{m}{\renewcommand*{\ist@thedepartment}{#1}}

\newcommand*{\ist@thegroup}{@group}
\newcommand*{\thegroup}{\ist@thegroup}
\NewDocumentCommand{\group}{m}{\renewcommand*{\ist@thegroup}{#1}}

\newcommand*{\ist@thesupervisor}{@supervisor}
\newcommand*{\thesupervisor}{\ist@thesupervisor}
\NewDocumentCommand{\supervisor}{m}{\renewcommand*{\ist@thesupervisor}{#1}}

\newcommand*{\ist@thesupervisortwo}{}
\newcommand*{\thesupervisortwo}{\ist@thesupervisortwo}
\NewDocumentCommand{\supervisortwo}{m}{\renewcommand*{\ist@thesupervisortwo}{#1}}

\newcommand*{\ist@thechairperson}{@chairperson}
\newcommand*{\thechairperson}{\ist@thechairperson}
\NewDocumentCommand{\chairperson}{m}{\renewcommand*{\ist@thechairperson}{#1}}

\newcommand*{\ist@themembercommittee}{@membercommittee}
\newcommand*{\themembercommittee}{\ist@themembercommittee}
\NewDocumentCommand{\membercommittee}{m}{\renewcommand*{\ist@themembercommittee}{#1}}

\newcommand*{\ist@themembercommitteetwo}{}
\newcommand*{\themembercommitteetwo}{\ist@themembercommitteetwo}
\NewDocumentCommand{\membercommitteetwo}{m}{\renewcommand*{\ist@themembercommitteetwo}{#1}}

\newcommand*{\ist@thedate}{@date}
\newcommand*{\thedate}{\ist@thedate}
\RenewDocumentCommand{\date}{m}{\renewcommand*{\ist@thedate}{#1}}

\newcommand*{\ist@thecoverimage}{}
\newcommand*{\thecoverimage}{\ist@thecoverimage}
\NewDocumentCommand{\coverimage}{m}{\renewcommand*{\ist@thecoverimage}{#1}}

\AtBeginDocument{
  \hypersetup{
    pdftitle={\thetitle},%
    pdfsubject={\thesubject},%
    pdfauthor={\theauthor},%
    pdfkeywords={\thekeywordsen},%
  }%
}

%-------------------------------------------------------------------------------
% Custom packages
%-------------------------------------------------------------------------------
\ifist@portuguese
\PassOptionsToPackage{mainlanguage=portuguese}{ist-text}
\NewDocumentCommand{\foreign}{O{english}m}{\texorpdfstring{\emph{\textlang{#1}{#2}}}{#2}}
\else
\PassOptionsToPackage{mainlanguage=english}{ist-text}
\NewDocumentCommand{\foreign}{O{portuguese}m}{\texorpdfstring{\emph{\textlang{#1}{#2}}}{#2}}
\fi

\RequirePackage[onehalfspacing]{ist-text}
\RequirePackage{ist-math}

\RequirePackage{ist-float}

\RequirePackage{ist-ref}
\RequirePackage{ist-bib}

\RequirePackage{ist-color}
\RequirePackage[plots,pies]{ist-tikz}

\pdfstringdefDisableCommands{
  \def\foreign{}%
}

%-------------------------------------------------------------------------------
% Language
%-------------------------------------------------------------------------------
\newcommand*{\abstracten}{Abstract}
\newcommand*{\abstractpt}{Resumo}

\newcommand*{\acknowledgments}{@undefined}
\addto\captionsenglish{\renewcommand*{\acknowledgments}{Acknowledgements}}
\addto\captionsportuguese{\renewcommand*{\acknowledgments}{Agradecimentos}}

\newcommand*{\ist@coverthesis}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@coverthesis}{Thesis to obtain the Master of Science Degree in}}
\addto\captionsportuguese{\renewcommand*{\ist@coverthesis}{Dissertação para obtenção do Grau de Mestre em}}

\newcommand*{\ist@coversupervisor}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@coversupervisor}{Supervisor}}
\addto\captionsportuguese{\renewcommand*{\ist@coversupervisor}{Orientador}}

\newcommand*{\ist@coversupervisors}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@coversupervisors}{Supervisors}}
\addto\captionsportuguese{\renewcommand*{\ist@coversupervisors}{Orientadores}}

\newcommand*{\ist@coverexaminationcommittee}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@coverexaminationcommittee}{Examination Committee}}
\addto\captionsportuguese{\renewcommand*{\ist@coverexaminationcommittee}{Júri}}

\newcommand*{\ist@coverchairperson}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@coverchairperson}{Chairperson}}
\addto\captionsportuguese{\renewcommand*{\ist@coverchairperson}{Presidente}}

\newcommand*{\ist@covermembercommittee}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@covermembercommittee}{Member of the Committee}}
\addto\captionsportuguese{\renewcommand*{\ist@covermembercommittee}{Vogal}}

\newcommand*{\ist@covermemberscommittee}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@covermemberscommittee}{Members of the Committee}}
\addto\captionsportuguese{\renewcommand*{\ist@covermemberscommittee}{Vogais}}

\newcommand*{\ist@istdeclarationtitle}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@istdeclarationtitle}{Declaration}}
\addto\captionsportuguese{\renewcommand*{\ist@istdeclarationtitle}{Declaração}}

\newcommand*{\ist@istdeclarationtext}{@undefined}
\addto\captionsenglish{\renewcommand*{\ist@istdeclarationtext}{I declare that this document is an original work of my own authorship and that it fulfills all the requirements of the Code of Conduct and Good Practices of the Universidade de Lisboa.}}
\addto\captionsportuguese{\renewcommand*{\ist@istdeclarationtext}{Declaro que o presente documento é um trabalho original da minha autoria e que cumpre todos os requisitos do Código de Conduta e Boas Práticas da Universidade de Lisboa.}}

\newcommand*{\ist@fmldeclarationtext}{O Trabalho Final é da exclusiva responsabilidade do seu autor, não cabendo qualquer responsabilidade à FMUL pelos conteúdos nele apresentados.}

%-------------------------------------------------------------------------------
% Page geometry
%-------------------------------------------------------------------------------
\RequirePackage[
  luatex,
  top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm,
  marginpar=0cm
]{geometry}

\ifist@showoverfull%
\overfullrule=1mm
\fi

%-------------------------------------------------------------------------------
% Font
%-------------------------------------------------------------------------------
\ifist@overridefont
\else
\setmainfont{TeX Gyre Termes}[Ligatures=TeX]
\setsansfont{TeX Gyre Heros}[Ligatures=TeX]
\setmonofont{TeX Gyre Cursor}[Ligatures=TeX]

\renewcommand*{\familydefault}{\sfdefault}

\sisetup{detect-all}
\fi

\NewDocumentCommand{\ist@coverfontln}{}{\normalfont\fontsize{16pt}{16pt}\selectfont}
\NewDocumentCommand{\ist@coverfontlb}{}{\bfseries\fontsize{16pt}{16pt}\selectfont}
\NewDocumentCommand{\ist@coverfontmn}{}{\normalfont\fontsize{14pt}{14pt}\selectfont}
\NewDocumentCommand{\ist@coverfontmb}{}{\bfseries\fontsize{14pt}{14pt}\selectfont}
\NewDocumentCommand{\ist@coverfontsn}{}{\normalfont\fontsize{12pt}{12pt}\selectfont}

%-------------------------------------------------------------------------------
% Glossaries
%-------------------------------------------------------------------------------
\RequirePackage[abbreviations,record,toc=false]{glossaries-extra}

\renewcommand*{\glsdonohyperlink}[2]{{
  \glsxtrprotectlinks\edef\fieldvalue{
    \glsxtrusefield{\glslabel}{hastarget}%
  }%
  \ifdefstring\fieldvalue{true}{#2}{
    \gGlsXtrSetField{\glslabel}{hastarget}{true}%
    \glsdohypertarget{#1}{#2}%
  }%
}}

\newcommand*{\textgls}[1]{\text{\glsxtrshort{#1}}}
\newcommand*{\textglspl}[1]{\text{\glsxtrshortpl{#1}}}

%-------------------------------------------------------------------------------
% Cover
%-------------------------------------------------------------------------------
\renewcommand*{\maketitle}{
  \ifx\ist@thecoverpage\ist@emptycommand%
  \begin{titlepage}
    \includegraphics[bb=9.5cm 11cm 0cm 0cm, scale=0.29]{\ist@thefacultylogo}

    \begin{center}
      \vspace{2.5cm}
      \ifx\ist@thecoverimage\ist@emptycommand%
      \vspace{2.5cm}
      \else%
      \includegraphics[height=50mm]{\ist@thecoverimage}
      \fi%

      \vspace{1.0cm}
      {\ist@coverfontlb\ist@thetitle} \\
      \ifx\ist@thesubtitle\ist@emptycommand%
      \vspace{2cm}
      \else
      \vspace{0.2cm}
      {\ist@coverfontmn\ist@thesubtitle} \\
      \vspace{1.8cm}
      \fi
      {\ist@coverfontmb\ist@theauthor} \\
      \vspace{2.0cm}
      {\ist@coverfontsn\ist@coverthesis} \\
      \vspace{0.3cm}
      {\ist@coverfontlb\ist@thecourse} \\
      \vspace{1.0cm}
      {\ist@coverfontsn
      \begin{tabular}{rl}
        \ifx\ist@thesupervisortwo\ist@emptycommand%
        \ist@coversupervisor:       & \ist@thesupervisor    \\
        \else%
        \ist@coversupervisors:      & \ist@thesupervisor    \\
        & \ist@thesupervisortwo
        \fi%
      \end{tabular} } \\
      \vspace{1.0cm}
      {\ist@coverfontmb \ist@coverexaminationcommittee} \\
      \vspace{0.3cm}
      {\ist@coverfontsn %
      \begin{tabular}{rl}
        \ist@coverchairperson:          & \ist@thechairperson        \\
        \ist@coversupervisor:           & \ist@thesupervisor         \\
        \ifx\ist@themembercommitteetwo\ist@emptycommand%
        \ist@covermembercommittee:  & \ist@themembercommittee    \\
        \else%
        \ist@covermemberscommittee: & \ist@themembercommittee    \\
        & \ist@themembercommitteetwo
        \fi%
      \end{tabular} } \\
      \vspace{1.5cm}
      {\ist@coverfontmb\ist@thedate} \\
    \end{center}
  \end{titlepage}

  \thispagestyle{empty}
  \cleardoublepage
  \else%
  \includepdf[pages={1,{}}]{\ist@thecoverpage}
  \fi%
}

%-------------------------------------------------------------------------------
% Prefix
%-------------------------------------------------------------------------------
% ----- Dedication -----
\NewDocumentCommand{\dedication}{m}{
  \null\vskip5cm%
  \begin{flushright}
    #1
  \end{flushright}
  \vfill\newpage
  \cleardoublepage
}

% ----- Declaration -----
\NewDocumentCommand{\declaration}{}{
  \null\vskip5cm%
  \begin{flushleft}
    \ist@istdeclarationtitle \\
    \ist@istdeclarationtext
  \end{flushleft}
  \vfill\newpage
  \cleardoublepage
}
