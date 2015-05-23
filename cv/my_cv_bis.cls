%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv_bis}[2014/03/02 Classe personnalisée de CV]

%-------------------------------------------------------------------------------
%                chargement de la classe mère
%-------------------------------------------------------------------------------
\LoadClass[a4paper]{article}


%-------------------------------------------------------------------------------
%                required packages
%-------------------------------------------------------------------------------
\RequirePackage{ifthen}
\RequirePackage[compact]{titlesec}% personnalisation des titres
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
\RequirePackage[left=1cm,top=0.0cm,right=1.5cm, bottom=1cm,noheadfoot]{geometry}
\RequirePackage{marvosym}% symbols like \Telefon, \Mobilefone, \Letter and \Email
\RequirePackage{url}
\RequirePackage{lipsum}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{graphicx}


%-------------------------------------------------------------------------------
%                couleurs et tailles
%-------------------------------------------------------------------------------
\pagestyle{empty}
\renewcommand*\familydefault{\sfdefault}

\definecolor{lightgray}{gray}{0.45}
\definecolor{gray}{gray}{0.30}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{urlcolor}{rgb}{0, 0, 0.5}

\definecolor{darkgray}{HTML}{2B2B2B}
\definecolor{theme}{HTML}{2468a1}
%\definecolor{theme}{HTML}{C74200}
%\definecolor{theme}{HTML}{A42600}
\RequirePackage[
	pdftex,
	pdfstartview={XYZ 0 1000 1.0},
	bookmarks=false,
	colorlinks,
	breaklinks=true,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=urlcolor,
	pdfborder={0 0 0}
]{hyperref}


\color{darkgray}

\setlength{\parindent}{0cm}
\newlength{\mainwidth}
\setlength{\mainwidth}{\textwidth}

\hypersetup{
	pdfauthor   = {Antoine de Roquemaurel},		% C'est vous qui avez fait le PDF
	pdftitle    = {Curriculum Vitae de Antoine de Roquemaurel},
%	pdfsubject  = {},
%	pdfkeywords = {},
	pdfcreator  = {PDFLaTeX},						% Vous l'avez fait avec LateX !
	pdfproducer = {PDFLaTeX}
}


%-------------------------------------------------------------------------------
%                mise en forme des sections et subsections
%-------------------------------------------------------------------------------
\titleformat{\section}
{\vspace{5mm}\fontfamily{pag}\selectfont\Large\bfseries\scshape\raggedright\color{theme}}
%	{\vspace{1mm}\fontfamily{pag}\selectfont\Large\bfseries\raggedright\color{theme}}
	{\raggedleft{\color{theme}\rule[1.5mm]{0.15\mainwidth}{0.3ex}}}{0.03\mainwidth}			% Can be used to give a prefix to all sections, like 'Section ...'
	{}					% Can be used to insert code before the heading
	[\vspace{-2mm}]	% Inserts code after the title
	
\titleformat{\subsection}
	{\fontfamily{pag}\selectfont\large\scshape\raggedright\color{theme}}
	{}{0em}
	{}
	[\vspace{-2mm}]
	
\renewcommand{\paragraph}[1]{\textbf{#1}}


%-------------------------------------------------------------------------------
%                heading
%-------------------------------------------------------------------------------
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newcommand*{\mobile}[1]{\Mobilefone~#1}
\newcommand*{\phone}[1]{\Telefon~#1}
\newcommand*{\email}[1]{\Letter~#1}

\newcommand{\contact}[3]{
	#1\\
	\vspace{3mm}
	#2\\
	\vspace{3mm}
	#3
}

\newenvironment{changemargin}[2]{
	\begin{list}{}{
		\setlength{\topsep}{0pt}
		\setlength{\leftmargin}{#1}
		\setlength{\rightmargin}{#2}
		\setlength{\topmargin}{#2}
		\setlength{\listparindent}{\parindent}
		\setlength{\itemindent}{\parindent}
		\setlength{\parsep}{\parskip}
	}
	\item[]
}{
	\end{list}
}
	
\newcommand{\heading}[5]{
	\begin{changemargin}{-1cm}{-1cm}
		\colorbox{theme}{
		\begin{minipage}{\paperwidth}
		\vspace{0.2cm}
			% photo
			\ifx#5{
				\hspace{1.5cm}
			}\else{
				\hspace{2mm}
				\begin{minipage}{2.5cm}
					\includegraphics[width=2.5cm]{#5}
				\end{minipage}
				\hspace{0mm}
			}\fi
			% titre
			\begin{minipage}[c]{0.49\paperwidth}
				\fontfamily{pag}\selectfont
				\color{white}
				\Huge{#1 \textbf{\textsc{#2}}}
				
				\vspace{2mm}
				\Large{\itshape #3}
			\end{minipage}
			\vspace{4mm}
			% contacts
			\begin{minipage}[r]{6.6cm}
\vspace{10px}
				\bfseries
				\color{white}
				\flushright
				#4
			\end{minipage}
			\vspace{-20px}
		\end{minipage}
		}
	\end{changemargin}
}


%-------------------------------------------------------------------------------
%                entrées
%-------------------------------------------------------------------------------
\newcommand*{\up}[1]{$^{\mbox{\footnotesize #1}}$}
\newcommand*{\phoneP}[1]{\Telefon~#1}

\newlength{\maincolumnwidth}
\setlength{\maincolumnwidth}{15cm}

% usage: \cvline{margintext}{linetext}
\newcommand*{\cvline}[2]{
	\begin{tabular}{@{}p{0.15\mainwidth}@{\hspace{0.03\mainwidth}}p{\dimexpr \textwidth-0.15\mainwidth-10mm}@{}}
		\raggedleft{#1} &{#2}\\
	\end{tabular}\hfill
	\vspace{0.7mm}
}

% usage: \cvline{margintext}{linetext}
\newcommand*{\cvlinebis}[2]{
	\begin{tabular}{@{}p{0.15\mainwidth}@{\hspace{0.03\mainwidth}}p{0.855\mainwidth}@{}}
		\raggedleft{#1} &\raggedright{#2}
	\end{tabular}
}

% usage: \cvuniq{some text}
\newcommand*{\cvuniq}[1]{
	\begin{tabular}{@{}p{\textwidth}@{}}
		#1\\
	\end{tabular}\hfill
	\vspace{0.7mm}
}
	
\newcommand{\cvitem}[1]{
	--~#1\hfill
	\vspace{0.7mm}
}
  
% usage: \cventry{years}{degree/job title}{institution/employer}{localization}{optional: grade/...}{optional: comment/job description}
\newcommand*{\cventry}[6]{
	\hspace{0px}
	\vspace{0.5mm}
	\cvlinebis{#1}{
		{\bfseries#2}
		\ifx#3\else{\hfill{\small\color{gray}\slshape#3}}\fi
		\ifx#4\else{{\small\color{gray},~#4}}\fi
		\ifx#5\else{\newline#5}\fi
		\ifx#6\else{\newline\small#6}\fi
	}
	\vspace{1mm}
}

\newcommand{\course}[1]{
	\ensuremath{\triangleright}~#1
}

\newcommand{\proleft}[3] {
	#1\\\vspace{0.5mm}
	\small{\color{gray}{#2}\\\color{lightgray}{#3}}
}


%-------------------------------------------------------------------------------
%                configuration
%-------------------------------------------------------------------------------
%\hypersetup{%
%	breaklinks,
%	baseurl       = http://,%
%	pdfborder     = 0 0 0,%
%	pdfpagemode   = UseNone,%
%	%  pdfstartview  = XYZ,%
%	pdfstartpage  = 1,%
%	pdfcreator    = \LaTeX{} with `moderncv' package,%
%	pdfproducer   = \LaTeX
%}
%\AtEndOfClass{%
%	\AtBeginDocument{%
%		\hypersetup{%
%			pdfauthor     = \@firstname~\@familyname,%
%			pdftitle      = \@title,%
%			pdfsubject    = \@firstname~\@familyname,%
%			pdfkeywords   = \@firstname~\@familyname{} CV
%		}
%	}
%}
%\urlstyle{tt}
