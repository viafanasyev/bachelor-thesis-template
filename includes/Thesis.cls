% MIT License
%
% Copyright (c) 2022 Vitaly Afanasyev
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{includes/Thesis}

\LoadClass[a4paper, 12pt]{article}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{array}
\RequirePackage{color}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage[titles]{tocloft}
\RequirePackage{caption}
\RequirePackage{etoolbox}
\RequirePackage{array,multirow}
\RequirePackage{tabularx,ragged2e}
\RequirePackage{makecell}
\RequirePackage{keyval}
\RequirePackage{datatool}
\RequirePackage{ifthen}
\RequirePackage[main=russian,english]{babel}
\RequirePackage{listings}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{soulutf8}
\RequirePackage{totcount}
\RequirePackage[figure,table,lstlisting]{totalcount}
\RequirePackage{tikz}
\RequirePackage{intcalc}
\RequirePackage{refcount}
\RequirePackage{csquotes}

\bibliographystyle{gost-numeric.bbx}
\RequirePackage[
    parentracker=true,
    backend=biber,
    bibstyle=gost-numeric,
    citestyle=gost-numeric,
    hyperref=true,
    bibencoding=utf8,
    language=auto,
    autolang=other,
    defernumbers=true,
    doi=false,
    eprint=false,
    isbn=false,
    dashed=false,
    url=false
]{biblatex}
\RequirePackage{bibentry}
\RequirePackage[unicode]{hyperref}

%% ====================================================================================================
%% ============================================= Main keys ============================================
%% ====================================================================================================

\def\@true{true}
\def\@false{false}
\def\@TODO{{\color{red}{TODO}}}

\define@key{thesisKeys}{institute}{\def\@institute{#1}}
\define@key{thesisKeys}{faculty}{\def\@faculty{#1}}
\define@key{thesisKeys}{year}{\def\@year{#1}}
\define@key{thesisKeys}{city}{\def\@city{#1}}
\define@key{thesisKeys}{title}{\def\@title{#1}}
\define@key{thesisKeys}{authorGroup}{\def\@authorGroup{#1}}
\define@key{thesisKeys}{authorName}{\def\@authorName{#1}}
\define@key{thesisKeys}{UDC}{\def\@UDC{#1}}
\define@key{thesisKeys}{educationalProgram}{\def\@educationalProgram{#1}}
\define@key{thesisKeys}{academicTeacherTitle}{\def\@academicTeacherTitle{#1}}
\define@key{thesisKeys}{academicTeacherName}{\def\@academicTeacherName{#1}}
\define@key{thesisKeys}{academicCoteacherTitle}{\def\@academicCoteacherTitle{#1}}
\define@key{thesisKeys}{academicCoteacherName}{\def\@academicCoteacherName{#1}}
\define@key{thesisKeys}{academicSupervisorTitle}{\def\@academicSupervisorTitle{#1}}
\define@key{thesisKeys}{academicSupervisorName}{\def\@academicSupervisorName{#1}}
\define@key{thesisKeys}{consultantTitle}{\def\@consultantTitle{#1}}
\define@key{thesisKeys}{consultantName}{\def\@consultantName{#1}}
\define@key{thesisKeys}{isAcademic}[true]{\def\@isAcademic{#1}}
\define@key{thesisKeys}{hasAcademicCoteacher}[true]{\def\@hasAcademicCoteacher{#1}}
\define@key{thesisKeys}{hasConsultant}[true]{\def\@hasConsultant{#1}}
\define@key{thesisKeys}{isAuthorFemale}[true]{\def\@isAuthorFemale{#1}}
\define@key{thesisKeys}{keywordsRu}{\def\@keywordsRu{\textbf{Ключевые слова:} #1.}}
\define@key{thesisKeys}{keywordsEn}{\def\@keywordsEn{\textbf{Keywords:} #1.}}
\define@key{thesisKeys}{refsSorting}[none]{\def\@refsSorting{#1}}
\newcommand{\@setThesisKeysDefaults}{
    \setkeys{thesisKeys}{
        institute = ПРАВИТЕЛЬСТВО РОССИЙСКОЙ ФЕДЕРАЦИИ\\ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ\\ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ\\НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ\\<<ВЫСШАЯ ШКОЛА ЭКОНОМИКИ>>,
        faculty = Факультет компьютерных наук\\Департамент программной инженерии,
        year = 2022,
        city = Москва,
        title = \@TODO,
        authorGroup = \@TODO,
        authorName = \@TODO,
        UDC = \@TODO,
        educationalProgram = 09.03.04 <<Программная инженерия>>,
        academicTeacherTitle = \@TODO,
        academicTeacherName = \@TODO,
        academicCoteacherName = \@TODO,
        academicCoteacherTitle = \@TODO,
        academicSupervisorTitle = {Академический руководитель\\образовательной программы\\<<Программная инженерия>>,\\профессор департамента программной\\инженерии, канд. техн. наук},
        academicSupervisorName = В. В. Шилов,
        consultantTitle = \@TODO,
        consultantName = \@TODO,
        isAcademic = false,
        hasAcademicCoteacher = false,
        hasConsultant = false,
        isAuthorFemale = false,
        keywordsRu = \@TODO,
        keywordsEn = \@TODO,
        refsSorting = none,
    }
}
\@setThesisKeysDefaults

%% ====================================================================================================
%% ============================================= Sections =============================================
%% ====================================================================================================

%% Title page

\newcolumntype{C}{>{\Centering\arraybackslash}X}
\newcommand*\@makeTitlePage{
    \pagestyle{empty}
    \clearpage
    \hyphenchar\font=-1 % Disable hyphenation temporarily

    \begin{titlepage}
        \begin{center}
            \textbf{\@institute}
    		\par\vspace{5mm}
    		\@faculty

            \ifx\@isAcademic\@true
    		    \par\vspace{5mm}
                \begin{flushleft}
                    УДК \@UDC
                \end{flushleft}
            \else
    		    \par\vspace{10mm}
            \fi

            \ifx\@hasAcademicCoteacher\@true
                \begin{table}[h!]
                \centering
    		    \begin{tabularx}{\textwidth}{C  C}
        			СОГЛАСОВАНО & УТВЕРЖДАЮ\\
        			& \\
        			\makecell[C]{Научный руководитель,\\ \@academicTeacherTitle} & \multirowcell{4}[1ex][C]{\@academicSupervisorTitle} \\
        			& \\
        			\underline{\hspace{4cm}} \@academicTeacherName & \\
        			<<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г. & \\
        			& \\
        			\makecell[C]{Соруководитель,\\ \@academicCoteacherTitle} & \\
        			& \\
        			\underline{\hspace{4cm}} \@academicCoteacherName & \underline{\hspace{4cm}} \@academicSupervisorName \\
        			<<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г. & <<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г.\\
        		\end{tabularx}
        		\end{table}
            \else
                \begin{table}[h!]
                \centering
    		    \begin{tabularx}{\textwidth}{C  C}
        			СОГЛАСОВАНО & УТВЕРЖДАЮ\\
        			& \\
        			\makecell[C]{Научный руководитель,\\ \@academicTeacherTitle} & \makecell[C]{\@academicSupervisorTitle} \\
        			& \\
        			\underline{\hspace{4cm}} \@academicTeacherName & \underline{\hspace{4cm}} \@academicSupervisorName \\
        			<<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г. & <<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г.\\
        		\end{tabularx}
        		\end{table}
    		\fi

            \ifx\@hasAcademicCoteacher\@true
        	    \vspace{5mm}
    	    \else
    	        \vspace{15mm}
	        \fi
        	\textbf{Выпускная квалификационная работа}\\
        	\ifx\@isAcademic\@true
        	    (академическая)\\
    	    \else
    	        (проектная)\\
    	    \fi
            \par\vspace{5mm}
        	на тему: \textbf{\@title}\\
            \par\vspace{5mm}
        	по направлению подготовки \@educationalProgram\\
    	\end{center}

        \ifx\@hasConsultant\@true
            \begin{table}[h!]
            \centering
		    \begin{tabularx}{\textwidth}{C  C}
    			СОГЛАСОВАНО & \thead{\ifx\@isAuthorFemale\@true ВЫПОЛНИЛА \else ВЫПОЛНИЛ \fi}\\
    			& \\
    			\makecell[C]{Консультант,\\ \@consultantTitle{}} & \makecell[C]{{\ifx\@isAuthorFemale\@true студентка \else студент \fi}группы \@authorGroup{} \\ образовательной программы \\ \@educationalProgram{}} \\
    			& \\
    			\underline{\hspace{4cm}} \@consultantName{} & \underline{\hspace{4cm}} \@authorName{} \\
    			<<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г. & <<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г.\\
    		\end{tabularx}
    		\end{table}
		\else
            \begin{table}[h!]
            \centering
		    \begin{tabularx}{\textwidth}{C  C}
    			& \thead{\ifx\@isAuthorFemale\@true ВЫПОЛНИЛА \else ВЫПОЛНИЛ \fi}\\
    			& \\
    			& \makecell[C]{{\ifx\@isAuthorFemale\@true студентка \else студент \fi}группы \@authorGroup{} \\ образовательной программы \\ \@educationalProgram{}} \\
    			& \\
    			& \underline{\hspace{4cm}} \@authorName{} \\
    			& <<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} г.\\
    		\end{tabularx}
    		\end{table}
		\fi

    	\vfill
    	\hfill

        \begin{center}
            \@city~\@year
        \end{center}

        \hyphenchar\font=`\- % Enable hyphenation
        \vspace{-20mm}
        \clearpage
    \end{titlepage}

    \pagestyle{fancy}

    \setcounter{page}{2}
}

%% Abstract

\newcommand{\@abstractTotalCountsRu}{%
    Данная работа состоит из %
    \totalpages~\@quantityToLiteralRu{\totalpages}{страницы}{страниц}%
    , \totalchapters~\@quantityToLiteralRu{\totvalue{chaptersnum}}{главы}{глав}%
    \ifnum\totalfigures>0{, \totalfigures~\@quantityToLiteralRu{\totalfigures}{рисунка}{рисунков}}\fi%
    \ifnum\totallstlistings>0{, \totallstlistings~\@quantityToLiteralRu{\totallstlistings}{листинга}{листингов}}\fi%
    \ifnum\totaltables>0{, \totaltables~\@quantityToLiteralRu{\totaltables}{таблицы}{таблиц}}\fi%
    \ifnum\totvalue{additionsnum}>0{, \totaladditions~\@quantityToLiteralRu{\totvalue{additionsnum}}{приложения}{приложений}}\fi%
    . %
        \ifnum\intcalcMod{\numexpr\totvalue{refsnum} / 10\relax}{10}=1{%
            Использовано \totalrefs~источников% X10 - X19
        }\else{%
            \ifcase\intcalcMod{\totvalue{refsnum}}{10}\relax Использовано \totalrefs~источников% XX0
            \or Использован \totalrefs~источник% XX1
            \or Использовано \totalrefs~источника% XX2
            \or Использовано \totalrefs~источника% XX3
            \or Использовано \totalrefs~источника% XX4
            \else Использовано \totalrefs~источников% XX5 - XX9
            \fi%
        }\fi%
    .%
}

\newcommand{\@abstractTotalCountsEn}{%
    The paper contains %
    \totalpages~\@quantityToLiteralEn{\totalpages}{page}{pages}%
    , \totalchapters~\@quantityToLiteralEn{\totvalue{chaptersnum}}{chapter}{chapters}%
    \ifnum\totalfigures>0{, \totalfigures~\@quantityToLiteralEn{\totalfigures}{figure}{figures}}\fi%
    \ifnum\totallstlistings>0{, \totallstlistings~\@quantityToLiteralEn{\totallstlistings}{listing}{listings}}\fi%
    \ifnum\totaltables>0{, \totaltables~\@quantityToLiteralEn{\totaltables}{table}{tables}}\fi%
    \ifnum\totvalue{additionsnum}>0{, \totaladditions~\@quantityToLiteralEn{\totvalue{additionsnum}}{addition}{additions}}\fi% TODO: Приложение == Addition?
    . %
        \totalrefs~\@quantityToLiteralEn{\totvalue{refsnum}}{source is used}{sources are used}%
    .%
}

\newcommand{\@abstract}[2]{
    \clearpage
    \phantomsection
    \section*{Реферат} % TODO: "Реферат" или "Аннотация"?
    \addcontentsline{toc}{section}{Реферат}
    \input{#1}

    \@abstractTotalCountsRu

    \@keywordsRu

    \clearpage
    \phantomsection
    \section*{Abstract}
    \addcontentsline{toc}{section}{Abstract}
    \input{#2}

    \@abstractTotalCountsEn

    \@keywordsEn
}

\newcommand*\@makeAbstract{\@abstract{abstract-ru}{abstract-en}}
\newcommand*\setAbstractResource[2]{%
    \def\@makeAbstract{\@abstract{#1}{#2}}%
}

%% Terminology

\newcommand{\@terminology}[1]{
    \clearpage
    \phantomsection
    \section*{Используемые определения и термины}
    \addcontentsline{toc}{section}{Используемые определения и термины}
    \input{#1}
}

\newcommand*\@makeTerminology{\@terminology{terminology}}
\newcommand*\setTerminologyResource[1]{%
    \def\@makeTerminology{\@terminology{#1}}%
}

%% Table of contents

\newcommand{\@makeContents}{
    \clearpage % Original \tableofcontents doesn't end page
    \tableofcontents
}

%% Intro

\newcommand{\@intro}[1]{
    \clearpage
    \phantomsection
    \section*{Введение}
    \addcontentsline{toc}{section}{Введение}
    \input{#1}
}

\newcommand*\@makeIntro{\@intro{intro}}
\newcommand*\setIntroResource[1]{%
    \def\@makeIntro{\@intro{#1}}%
}

%% Chapters

\newtotcounter{chaptersnum}
\newcommand{\@@chapter}[2]{ % Double '@' is intentional - one '@' leads to compilation error (i think, it clashes with some internal command)
    \clearpage
    \stepcounter{chaptersnum}
    \section{#1}
    \input{#2}
}

\newcommand*\@makeChapters{}
\newcommand*\addChapter[2]{%
    \ifx\@makeChapters\empty
        \def\@makeChapters{\@@chapter{#1}{#2}}%
    \else
        \g@addto@macro\@makeChapters{\@@chapter{#1}{#2}}%
    \fi%
}

%% Conclusion

\newcommand{\@conclusion}[1]{%
    \clearpage
    \phantomsection
    \section*{Заключение}
    \addcontentsline{toc}{section}{Заключение}
    \input{#1}
}

\newcommand*\@makeConclusion{\@conclusion{conclusion}}
\newcommand*\setConclusionResource[1]{%
    \def\@makeConclusion{\@conclusion{#1}}%
}

%% References

\newcommand{\@makeReferences}{
    \label{LastPage} % Don't count bibliography and additions in total pages counter. TODO: Should it be here or after bibliography?
    \clearpage % Original \printbibliography doesn't end page
    \phantomsection
    \begin{sloppypar} % Prevents overfull in bibliography
    \begin{refcontext}[sorting={\@refsSorting}]
    \printbibliography[title=Список использованных источников]
    \end{refcontext}
    \end{sloppypar}
    \addcontentsline{toc}{section}{Список использованных источников}
}

%% Additions

\newtotcounter{additionsnum}
\newcommand{\@addition}[2]{
    \clearpage
    \stepcounter{additionsnum}
    \begin{flushright}
        \Large \textbf{\textsc{приложение \asbuk{additionsnum}}}
    \end{flushright}
    \setcounter{secnumdepth}{0}
    \section[Приложение \Asbuk{additionsnum}]{#1}
    \setcounter{secnumdepth}{4}
    \input{#2}
}

\newcommand*\@makeAdditions{%
    \titleformat{\section}[block]{\Large\bfseries\filcenter}{}{0mm}{}%
}
\newcommand*\addAddition[2]{%
    \g@addto@macro\@makeAdditions{\@addition{#1}{#2}}%
}

%% ====================================================================================================
%% ====================================== Main thesis environment =====================================
%% ====================================================================================================

\newenvironment{thesis}[1][]{
    \renewcommand*\@makeChapters{}
    \renewcommand*\@makeAdditions{\titleformat{\section}[block]{\Large\bfseries\filcenter}{}{0mm}{}}
    \renewcommand*\@makeAbstract{\@abstract{abstract-ru}{abstract-en}}
    \renewcommand*\@makeTerminology{\@terminology{terminology}}
    \renewcommand*\@makeIntro{\@intro{intro}}
    \setcounter{secnumdepth}{4}
    \setcounter{tocdepth}{4}
    \setcounter{chaptersnum}{0}
    \setcounter{refsnum}{0}
    \setcounter{additionsnum}{0}
    
    \document
        \setkeys{thesisKeys}{#1}
        \author{\@authorName} % That's used just to suppress warning
        \@makeTitlePage
}{
        \setcounter{figure}{0} % Reset counters after title page, because title page could use tables, figures, etc.
        \setcounter{table}{0}
        \setcounter{lstlisting}{0}

        \@makeAbstract
        \@makeTerminology
        \@makeContents
        \@makeIntro
        \@makeChapters
        \@makeConclusion
        \@makeReferences
        \@makeAdditions

        \@setThesisKeysDefaults % Fallback arguments to defaults, so that current options won't be implicitly used later
    \enddocument
}

%% ====================================================================================================
%% ============================================== Styles ==============================================
%% ====================================================================================================

\titlelabel{\thetitle.~}

\lstset{
    basicstyle=\small\ttfamily,
    tabsize=4,
    breaklines=true,
    columns=flexible
}

\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
    unicode=true
}

\geometry{left=10mm, right=10mm, top=25mm, bottom=25mm, headheight=25mm}

\DeclareCaptionLabelSeparator{emdash}{ --- }
\captionsetup{
	justification=centering,
	singlelinecheck=false,
	labelsep=emdash
}

\renewcommand{\cftsecpresnum}{Глава }
\newlength\mylength
\settowidth\mylength{\cftsecpresnum}
\addtolength\cftsecnumwidth{\mylength}

\titleformat{\section}[block]{\Large\bfseries\filcenter}{Глава \thesection.}{0mm}{~}
\titleformat{\subsection}{\normalfont\large\bfseries\raggedright}{\thesubsection.}{0mm}{~}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries\raggedright}{\thesubsubsection.}{0mm}{~}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries\raggedright}{\theparagraph.}{0mm}{~}
\renewcommand\theadfont{\normalfont\normalsize}

%% Footer

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{
    \begin{tabular}{c}
        \thepage
    \end{tabular}
}
\renewcommand\headrulewidth{0pt}

%% TOC

\tocloftpagestyle{fancy}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

%% Lists

\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}
\renewcommand{\theenumi}{(\asbuk{enumi})}
\renewcommand{\labelenumi}{\asbuk{enumi})}
\setenumerate[1]{label={\arabic*)}}
\setenumerate[2]{label={--}}
\setenumerate[3]{label={\asbuk*)}}

%% ====================================================================================================
%% =============================================== Misc ===============================================
%% ====================================================================================================

\newtotcounter{refsnum}
\AtEveryBibitem{\stepcounter{refsnum}}
\newcommand{\totalrefs}{\total{refsnum}}
\newcommand{\totalpages}{\getpagerefnumber{LastPage}}
\newcommand{\totalchapters}{\total{chaptersnum}}
\newcommand{\totaladditions}{\total{additionsnum}}

% #1: number
% #2: singular form
% #3: plural form
\newcommand{\@quantityToLiteralRu}[3]{%
    \ifnum\intcalcMod{\numexpr#1 / 10\relax}{10}=1{%
        #3%
    }\else{%
        \ifnum\intcalcMod{#1}{10}=1{#2}\else{#3}\fi%
    }\fi%
}

% #1: number
% #2: singular form
% #3: plural form
\newcommand{\@quantityToLiteralEn}[3]{%
    \ifnum#1>1{#3}\else{#2}\fi%
}

%% Russian alphabet definition for \DTLsort

\newboolean{@default}

\renewcommand*{\dtlsetUTFviiicharcode}[2]{
    \setboolean{@default}{true}
    \def\@case##1##2{\ifstrequal{#1}{##1}{\setboolean{@default}{false}##2}{}}
    \def\@default##1{\ifthenelse{\boolean{@default}}{##1}{}}

    \@case{а}{#2=123\relax}
    \@case{б}{#2=124\relax}
    \@case{в}{#2=125\relax}
    \@case{г}{#2=126\relax}
    \@case{д}{#2=127\relax}
    \@case{е}{#2=128\relax}
    \@case{ё}{#2=129\relax}
    \@case{ж}{#2=130\relax}
    \@case{з}{#2=131\relax}
    \@case{и}{#2=132\relax}
    \@case{й}{#2=133\relax}
    \@case{к}{#2=134\relax}
    \@case{л}{#2=135\relax}
    \@case{м}{#2=136\relax}
    \@case{н}{#2=137\relax}
    \@case{о}{#2=138\relax}
    \@case{п}{#2=139\relax}
    \@case{р}{#2=140\relax}
    \@case{с}{#2=141\relax}
    \@case{т}{#2=142\relax}
    \@case{у}{#2=143\relax}
    \@case{ф}{#2=144\relax}
    \@case{х}{#2=145\relax}
    \@case{ц}{#2=146\relax}
    \@case{ч}{#2=147\relax}
    \@case{ш}{#2=148\relax}
    \@case{щ}{#2=149\relax}
    \@case{ъ}{#2=150\relax}
    \@case{ы}{#2=151\relax}
    \@case{ь}{#2=152\relax}
    \@case{э}{#2=153\relax}
    \@case{ю}{#2=154\relax}
    \@case{я}{#2=155\relax}
    \@case{А}{#2=123\relax}
    \@case{Б}{#2=124\relax}
    \@case{В}{#2=125\relax}
    \@case{Г}{#2=126\relax}
    \@case{Д}{#2=127\relax}
    \@case{Е}{#2=128\relax}
    \@case{Ё}{#2=129\relax}
    \@case{Ж}{#2=130\relax}
    \@case{З}{#2=131\relax}
    \@case{И}{#2=132\relax}
    \@case{Й}{#2=133\relax}
    \@case{К}{#2=134\relax}
    \@case{Л}{#2=135\relax}
    \@case{М}{#2=136\relax}
    \@case{Н}{#2=137\relax}
    \@case{О}{#2=138\relax}
    \@case{П}{#2=139\relax}
    \@case{Р}{#2=140\relax}
    \@case{С}{#2=141\relax}
    \@case{Т}{#2=142\relax}
    \@case{У}{#2=143\relax}
    \@case{Ф}{#2=144\relax}
    \@case{Х}{#2=145\relax}
    \@case{Ц}{#2=146\relax}
    \@case{Ч}{#2=147\relax}
    \@case{Ш}{#2=148\relax}
    \@case{Щ}{#2=149\relax}
    \@case{Ъ}{#2=150\relax}
    \@case{Ы}{#2=151\relax}
    \@case{Ь}{#2=152\relax}
    \@case{Э}{#2=153\relax}
    \@case{Ю}{#2=154\relax}
    \@case{Я}{#2=155\relax}
    \@default{\dtlsetdefaultUTFviiicharcode{#1}{#2}}
}

\renewcommand*{\dtlsetUTFviiilccharcode}[2]{
    \setboolean{@default}{true}
    \def\@case##1##2{\ifstrequal{#1}{##1}{\setboolean{@default}{false}##2}{}}
    \def\@default##1{\ifthenelse{\boolean{@default}}{##1}{}}

    \@case{а}{#2=123\relax}
    \@case{б}{#2=124\relax}
    \@case{в}{#2=125\relax}
    \@case{г}{#2=126\relax}
    \@case{д}{#2=127\relax}
    \@case{е}{#2=128\relax}
    \@case{ё}{#2=129\relax}
    \@case{ж}{#2=130\relax}
    \@case{з}{#2=131\relax}
    \@case{и}{#2=132\relax}
    \@case{й}{#2=133\relax}
    \@case{к}{#2=134\relax}
    \@case{л}{#2=135\relax}
    \@case{м}{#2=136\relax}
    \@case{н}{#2=137\relax}
    \@case{о}{#2=138\relax}
    \@case{п}{#2=139\relax}
    \@case{р}{#2=140\relax}
    \@case{с}{#2=141\relax}
    \@case{т}{#2=142\relax}
    \@case{у}{#2=143\relax}
    \@case{ф}{#2=144\relax}
    \@case{х}{#2=145\relax}
    \@case{ц}{#2=146\relax}
    \@case{ч}{#2=147\relax}
    \@case{ш}{#2=148\relax}
    \@case{щ}{#2=149\relax}
    \@case{ъ}{#2=150\relax}
    \@case{ы}{#2=151\relax}
    \@case{ь}{#2=152\relax}
    \@case{э}{#2=153\relax}
    \@case{ю}{#2=154\relax}
    \@case{я}{#2=155\relax}
    \@case{А}{#2=123\relax}
    \@case{Б}{#2=124\relax}
    \@case{В}{#2=125\relax}
    \@case{Г}{#2=126\relax}
    \@case{Д}{#2=127\relax}
    \@case{Е}{#2=128\relax}
    \@case{Ё}{#2=129\relax}
    \@case{Ж}{#2=130\relax}
    \@case{З}{#2=131\relax}
    \@case{И}{#2=132\relax}
    \@case{Й}{#2=133\relax}
    \@case{К}{#2=134\relax}
    \@case{Л}{#2=135\relax}
    \@case{М}{#2=136\relax}
    \@case{Н}{#2=137\relax}
    \@case{О}{#2=138\relax}
    \@case{П}{#2=139\relax}
    \@case{Р}{#2=140\relax}
    \@case{С}{#2=141\relax}
    \@case{Т}{#2=142\relax}
    \@case{У}{#2=143\relax}
    \@case{Ф}{#2=144\relax}
    \@case{Х}{#2=145\relax}
    \@case{Ц}{#2=146\relax}
    \@case{Ч}{#2=147\relax}
    \@case{Ш}{#2=148\relax}
    \@case{Щ}{#2=149\relax}
    \@case{Ъ}{#2=150\relax}
    \@case{Ы}{#2=151\relax}
    \@case{Ь}{#2=152\relax}
    \@case{Э}{#2=153\relax}
    \@case{Ю}{#2=154\relax}
    \@case{Я}{#2=155\relax}
    \@default{\dtlsetdefaultUTFviiilccharcode{#1}{#2}}
}

%% ====================================================================================================
%% =========================================== Useful things ==========================================
%% ====================================================================================================

%% Terminology

\newcommand{\term}[2][]{
    \DTLnewrow{list}
    \DTLnewdbentry{list}{termLabel}{#1}
    \DTLnewdbentry{list}{termDesc}{#2}
}

\newenvironment{terminologyList}{
    \DTLifdbexists{list}{\DTLcleardb{list}}{\DTLnewdb{list}}
}{
    \DTLsort*{termLabel}{list}
    \begin{itemize}
        \DTLforeach*{list}{\theLabel=termLabel, \theDesc=termDesc}{\item[] \textbf{\theLabel}~-- \theDesc.}
    \end{itemize}
}

%% TODOs

\newcommand{\todo}[1]{\ifstrequal{#1}{}{\textbf{\textcolor{red}{TODO}}}{\textbf{\textcolor{red}{(TODO: #1)}}}}
\newcommand{\todoref}[2][]{\ifstrequal{#1}{}{}{\hl{#1}}\hypersetup{linkcolor = red}\footnote{\textcolor{red}{TODO: #2}}\hypersetup{linkcolor = black}}

%% Listings

\newcommand{\btHL}[1][]{%
    \begingroup%
    \tikzset{btHLParams/.style={#1}}%
    \begin{lrbox}{\@tempboxa}%
    \bgroup%
    \aftergroup\@btHLendenv%
}
\newcommand{\@btHLendenv}{%
    \end{lrbox}%
    \tikz[btHLParams]{%
        \pgfpathrectangle{\pgfpoint{1pt}{0pt}}{\pgfpoint{\wd \@tempboxa}{\ht \@tempboxa}}%
        \pgfusepath{use as bounding box}%
        \node[%
            anchor=base west, fill=gray!20, outer sep=0pt,inner xsep=1pt, inner ysep=0pt, btHLParams%
        ]{\raisebox{1pt}{\strut}\strut\usebox{\@tempboxa}};%
    }%
    \endgroup%
    \egroup%
}

\lstset{
    keywordstyle=\color{blue},
    basicstyle=\ttfamily,
    stringstyle=\color{ForestGreen},
    commentstyle=\color{gray},
    ndkeywordstyle={\color{orange}},
    identifierstyle=\color{black},
    basicstyle=\footnotesize\ttfamily,
    showstringspaces=false,
    language=java,
    morekeywords={project},
    breaklines=true,
    frame=L,
    framesep=5pt,
    xleftmargin=\parindent,
    numbers=left,
    stepnumber=1,
    firstnumber=1,
    backgroundcolor=\color{white},
    captionpos=b,
    caption=\@TODO
}

% Source: https://github.com/cansik/kotlin-latex-listing
\lstdefinelanguage{kotlin}{
    comment=[l]{//},
    keywords={!in, !is, abstract, actual, annotation, as, as?, break, by, catch, class, companion, const, constructor, continue, crossinline, data, delegate, do, dynamic, else, enum, expect, external, false, field, file, final, finally, for, fun, get, if, import, in, infix, init, inline, inner, interface, internal, is, lateinit, noinline, null, object, open, operator, out, override, package, param, private, property, protected, public, receiveris, reified, return, return@, sealed, set, setparam, super, suspend, tailrec, this, throw, true, try, typealias, typeof, val, var, vararg, when, where, while},
    morecomment=[s]{/*}{*/},
    morestring=[b]",
    morestring=[s]{"""*}{*"""},
    ndkeywords={@Deprecated, @JvmField, @JvmName, @JvmOverloads, @JvmStatic, @JvmSynthetic},
    sensitive=true
}

% Source: https://github.com/korfuri/golang-latex-listings
\lstdefinelanguage{golang}{
    morekeywords=[1]{break, default, func, interface, select, case, defer, go, map, struct, chan, else, goto, package, switch, const, fallthrough, if, range, type, continue, for, import, return, var},
    morekeywords=[2]{append, cap, close, complex, copy, delete, imag, len, make, new, panic, print, println, real, recover},
    morekeywords=[3]{bool, byte, complex64, complex128, error, float32, float64, int, int8, int16, int32, int64, rune, string, uint, uint8, uint16, uint32, uint64, uintptr},
    morekeywords=[4]{true, false, iota, nil},
    morestring=[b]{"},
    morestring=[b]{'},
    morestring=[b]{`},
    comment=[l]{//},
    morecomment=[s]{/*}{*/},
    sensitive=true
}

\lstdefinestyle{algorithmic}{
    mathescape=true,
    keywordstyle=\color{black}\bfseries,
    keywords={input, output, return, datatype, function, procedure, in, if, else, for, foreach, while, begin, end}
    numbers=left
}

% TODO: Smart figures, tables
