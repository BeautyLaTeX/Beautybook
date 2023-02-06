% BHCexam.cls
%
% A LaTeX2e document class for preparing exams.

%% BHCexam.cls
%% Copyright (c) 2011-2020 BAO HONG CHANG
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
% 
% This work consists of the files BHCexam.cls and BHCexamdoc.tex.
%
% The user's guide for exam.cls is in the file examdoc.tex.

%%% BAO HONG CHANG
%%% Mathcrowd Inc.
%%% Shanghai
%%% charles@mathcrowd.cn

% The newest version of this documentclass should always be available
% from my web page: https://github.com/mathedu4all/bhcexam

\def\fileversion{1.7}
\def\filedate{2022/07/29}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BHCexam}[\filedate\space Version \fileversion\space by
 BAO HONG CHANG]
 
 %                         *****************
 %                         **   宏包选项   **
 %                         *****************
 
 
 % 文档类支持以下宏包选项:
 
 % answers 显示解析
 % adobe 使用adobe字体
 % ubuntu 使用ubuntu字体
 % windows 使用windows字体
 % fandol 使用fandol字体，随texlive默认安装
 % mac 使用mac字体
 % list 以列表项目格式显示试题
 % twocolumn 使用A3纸张并分栏
  

\newif\if@printanswers \@printanswersfalse
\DeclareOption{answers}{\@printanswerstrue}

\newcommand\@fontset{windows}
\DeclareOption{adobe}{\renewcommand\@fontset{adobe}}
\DeclareOption{ubuntu}{\renewcommand\@fontset{ubuntu}}
\DeclareOption{mac}{\renewcommand\@fontset{mac}}
\DeclareOption{windows}{\renewcommand\@fontset{windows}}
\DeclareOption{fandol}{\renewcommand\@fontset{fandol}}

\newif\if@custom  \@customfalse
\DeclareOption{custom}{\@customtrue}

\newif\if@twocolumn  \@twocolumnfalse
\DeclareOption{twocolumn}{\@twocolumntrue}

\newif\if@list  \@listfalse
\DeclareOption{list}{\@listtrue}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[bb=ams,
				scr=rsfs]{mathalpha}		% 数学花体符号
\RequirePackage{hologo}				
\RequirePackage{extarrows}				
\RequirePackage{makecell}				


%% 字体设置
\RequirePackage[no-math]{fontspec}                  % 字体选择宏包
\RequirePackage[math-style=TeX,
            bold-style=ISO]{unicode-math}       % 数学unicode-math宏包
\setmathfont{XITS Math}                         % 设置数学字体为XITS Math
\setmathfont{XITS Math Bold}[version=bold]
\RequirePackage[fontset = \@fontset, punct=kaiming]{ctex}
\ctexset{linestretch = 4, autoindent = 0pt}

\if@custom
\RequirePackage{xpatch}

\ExplSyntaxOn
    \xpatchcmd\__xeCJK_check_family:n{\__xeCJK_warning:nxx}{\__xeCJK_info:nxx}{}{}
\ExplSyntaxOff
%中文字体
    %%%%%%%%%%%%中文字体设置%%%%%%%%%%%
    \setCJKmainfont[Path=fonts/chinesefonts/,BoldFont={FZFWZhuZiMinchoE.TTF},ItalicFont={FZXKTJW.TTF},SlantedFont = {FZXKK.TTF} , SlantedFeatures = {FakeSlant}]{FZXSSJW.TTF}
    \setCJKsansfont[Path=fonts/chinesefonts/,BoldFont={FZBaoHTJW_Cu.TTF},ItalicFont={FZXKK.TTF}]{FZBaoHTJW.TTF}
    \setCJKmonofont[Path=fonts/chinesefonts/,BoldFont={FZZHK.TTF},ItalicFont={FZHanSTJW.TTF}]{FZPingXYSJW.TTF}
    \newCJKfontfamily[song]\Songti{FZXSSJW.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[hei]\Heiti{FZBaoHTJW.TTF}[Path=fonts/chinesefonts/] %宝黑体
    \newCJKfontfamily[kai]\Kaiti{FZXKTJW.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[fs]\Fangsong{FZQingFSJW_Cu.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[liti]\Lishu{方正隶书简体.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[ZhuZiMinchoE]\songE{FZFWZhuZiMinchoE.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[ZhuZiMinchoD]\songD{FZFWZhuZiMinchoD.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[xk]\xingkai{FZXKK.TTF}[Path=fonts/chinesefonts/] %宋体
    \newCJKfontfamily[zhdbs]\dbs{FZDBSK.TTF}[Path=fonts/chinesefonts/] %宋体
    %%%%%%%%%%%%中文字体设置%%%%%%%%%%%
% 英文字体
\setmainfont{XITS}
\setmonofont{Courier New}
\setsansfont{Arial}
\fi
%                    *****************************
%                    **        加载其他宏包       **
%                    *****************************

\RequirePackage{tabularx, ifthen} % 排选项用
\RequirePackage{xcolor,graphicx,caption} % 彩色、图片、图释
\RequirePackage{geometry,fancyhdr} % 纸张、边距、页眉、页脚
\RequirePackage{etoolbox} 
\RequirePackage{amsmath,amsmath} % ams数学相关
\RequirePackage{unicode-math}
\RequirePackage{pifont} % 带圈数字\ding
\RequirePackage{bbding} % 图案
\RequirePackage{romannum} % 罗马数字
\RequirePackage{enumitem}



%                         *****************
%                         **   页面设置   **
%                         *****************


\AtBeginDocument{
	\pagenumbering{arabic}  % 使用阿拉伯数字页码
	\renewcommand{\parallel}{\mathrel{\mathpalette\new@parallel\relax}} % 重定义平行符号
	\newcommand{\new@parallel}[2]{%
		\begingroup
		\sbox\z@{高度}% get the height of an uppercase letter
		\resizebox{!}{\ht\z@}{\raisebox{\depth}{$\m@th#1/\mkern-10mu/$}}%
		\endgroup
	}
}


%
% 双栏显示
%
\if@twocolumn
\geometry{a3paper,landscape, twocolumn,columnsep=40mm,left=50mm,right=30mm,top=35mm,bottom=25mm,headheight=20mm}
\else
\geometry{a4paper,left=30mm,right=30mm,top=35mm,bottom=25mm, headheight=20mm}
\fi

%
% 图释
%
\captionsetup[figure]{font=small,belowskip=0pt}



%                         *****************
%                         **    试卷头    **
%                         *****************



\gdef\@subtitle{}
\gdef\@notice{}
\gdef\@author{}
\gdef\@date{}



\renewcommand{\headrulewidth}{0pt}
\renewcommand{\title}[1]{\gdef\@title{#1}}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\notice}[1]{\def\@notice{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\renewcommand{\date}[1]{\gdef\@date{#1}}

\renewcommand\maketitle{\begingroup
	\renewcommand{\baselinestretch}{2}
	\newpage
	\begin{center}
		\heiti \Large
		\@title \par
		\ifdefempty{\@subtitle}{}{
			\@subtitle \par
		}
	
		\ifdefempty{\@author}{}{
			\songti \normalsize
			\@author \par
		}
	
		\ifdefempty{\@notice}{}{
			\setlength{\fboxsep}{1em}
			\vspace{0.5\baselineskip}
			\fbox{
				\parbox{0.5\linewidth}{
					\kaishu \normalsize 
					\@notice \par
				}
			}
			\vspace{0.5\baselineskip}
		}
	

	\end{center}
	\renewcommand{\baselinestretch}{1}
	\ifdefempty{\@date}{}{
		\begin{flushright}
			\songti \small
			\@date \par
		\end{flushright}
	}
	\songti \normalsize
\endgroup}

\renewcommand\arraystretch{1.5}
\renewcommand{\baselinestretch}{1.5}

%                    ***************************
%                    **    试题、解答环境定义   **
%                    ***************************

\newcounter{Group}
\newcounter{Question}
\newcounter{Example}
\newcounter{Exercise}
\newcounter{Method}[Question]

\newif\if@showscore
\@showscorefalse
\newif\if@showskip
\@showskipfalse
\newif\if@showparen
\@showparenfalse
\newif\if@resetcounter
\@resetcounterfalse
\newlength{\myvertspace}


% 定义题组环境
\newenvironment{groups}{
	\if@list
		\list{\heiti\chinese{Group}.}{\usecounter{Group}}
	\else
		\par \begingroup \par
	\fi
}{
	\if@list
		\endlist
	\else
		\par \endgroup \par
	\fi
}

% 定义新增题组命令
\newcommand{\group}[2]{
	\if@list
		\item \heiti{#1} \quad \kaishu \small #2 \songti \normalsize \par
	\else
		\stepcounter{Group}
		\par \heiti{\par \chinese{Group} 、#1} \quad \small{\kaishu #2} \songti \normalsize \par
	\fi

}

% 定义试题环境
\newenvironment{questions}[1][]{
	\@tfor \@opt :=#1\do
		{\if\@opt s\global\@showscoretrue\fi
		\if\@opt t\global\@showskiptrue\fi
		\if\@opt p\global\@showparentrue\fi
		\if\@opt r\global\@resetcountertrue\fi}
\if@resetcounter
	\setcounter{Question}{0}
	\fi
	\if@list
		\list{\arabic{Question}.}{\setlength{\leftmargin}{0pt}}
	\else
		\par \begingroup \par
	\fi
}{
	\if@list
		\endlist
	\else
		\par \endgroup \par
	\fi
	
	\global\@showscorefalse
	\global\@showskipfalse
	\global\@showparenfalse
}

% 定义新增试题命令
\newcommand{\question}[1][0]{
	\stepcounter{Question}
	\if@list
		\item \if@showscore \kaishu ( #1 分) \songti \fi
	\else
		\vspace{2mm}

		\arabic{Question}. 
		\if@showscore \kaishu ( #1 分) \songti \fi
	\fi
}

% 定义新增例题命令
\newcommand{\example}[1][0]{
	\stepcounter{Example}
	\if@list
		\item[例题\arabic{Example}. ]
		\if@showscore \kaishu ( #1 分) \songti \fi
	\else
		\vspace{2mm}
		\par 例题\arabic{Example}. 
		\if@showscore \kaishu ( #1 分) \songti \fi
	\fi
}

% 定义新增习题命令
\newcommand{\exercise}[1][0]{
	\stepcounter{Exercise}
	\if@list
		\item[习题\arabic{Exercise}. ]
		\if@showscore \kaishu ( #1 分) \songti \fi
	\else
		\vspace{2mm}
		\par 习题\arabic{Exercise}. 
		\if@showscore \kaishu ( #1 分) \songti \fi
	\fi
}

% 定义小问环境
\newlist{subquestions}{enumerate}{2}
\setlist[subquestions,1]{label=(\arabic*)}
\setlist[subquestions,2]{label=(\roman*)}

% 定义新增小问命令
\newcommand{\subquestion}{\item} 

\newenvironment{solution}[1]{
	\setlength{\myvertspace}{#1}
	\par \if@printanswers \par \color{red} \begingroup \else \if@showskip \vspace*{\myvertspace} \fi \setbox\z@\vbox\bgroup\fi \songti
}{
	\par \if@printanswers \endgroup \color{black} \else \egroup \fi \par
}

\newcommand{\hint}{
	\par \fbox{\heiti{提示}} \par \songti
}
\newcommand{\method}{
	\stepcounter{Method}
	\vspace{2mm}
	\par \fbox{\heiti{解法\chinese{Method}}} \par \songti
}
	
\newcommand{\methodonly}{
	\par \fbox{\heiti{解答}} \par \songti
}

\newcommand{\score}[2]{
	\par
	\dotfill 本步骤 #1 分， 累计 #2 分
	\par}

\makeatletter
\newcommand{\build}[2]{\leavevmode
	\count@=\z@ \toks@={}%
	\loop\ifnum\count@<\numexpr#1\relax
	\toks@=\expandafter{\the\toks@#2}%
	\advance\count@\@ne
	\repeat
	\the\toks@}
\makeatletter

\newlength{\keylength}
\newcommand{\key}[1]{
	\if@printanswers
	\underline{~~#1~~}
	\else
	\settowidth{\keylength}{~~#1~~}
	\build{13}{\hskip1sp\kern-1sp\hbox to 0.1\keylength{\hrulefill}}
	\fi}

\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\choicelengthe}
\newlength{\maxlength}

% 三个选项
\newcommand{\threechoices}[3]{
	\if@showparen \dotfill (\qquad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}

	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & \\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ &\\ 
			\end{tabularx}
		}
	}
	\unskip \unskip 
}

% 四个选项
\newcommand{\fourchoices}[4]{
	\if@showparen \dotfill (\qquad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~\\ 
			\end{tabularx}
		}%
	}
	\unskip \unskip 
}

% 五个选项
\newcommand{\fivechoices}[5]{
	\if@showparen \hfill \dotfill (\quad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\settowidth{\choicelengthe}{E.~#5~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\choicelengthe>\maxlength}}{\setlength{\maxlength}{\choicelengthe}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
			E.~#5~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
				E.~#5~~~ &         \\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~ \\
				E.~#5~~~  &          &          &          \\
			\end{tabularx}
		}
	}%
	\unskip \unskip 
}

% 六个选项
\newcommand{\sixchoices}[6]{
	\if@showparen \hfill \dotfill (\quad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\settowidth{\choicelengthe}{D.~#5~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}	\ifthenelse{\lengthtest{\choicelengthe>\maxlength}}{\setlength{\maxlength}{\choicelengthe}}{}
	
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\linewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
			E.~#5~~~\\
			F.~#6~~~\\
		\end{tabularx}
	}%
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{
			\begin{tabularx}{\linewidth}{XX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
				E.~#5~~~ & F.~#6~~~\\
			\end{tabularx}
		}%
		{
			\begin{tabularx}{\linewidth}{XXXX}
				\setlength\tabcolsep{0pt}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~ \\
				E.~#2~~~  & F.~#6~~~ &          &          \\
			\end{tabularx}
		}%
	}
	\unskip \unskip 
}


%                    ***************************
%                    **   CUSTOMIZED COMMAND  **
%                    ***************************

\newcommand\abs[1]{\left|#1\right|}
\newcommand{\gt}{>}
\newcommand{\lt}{<}
\renewcommand{\geq}{\geqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\leq}{\leqslant}
\renewcommand{\le}{\leqslant}
\renewenvironment{split}{\begin{aligned}}{\end{aligned}}



\endinput
