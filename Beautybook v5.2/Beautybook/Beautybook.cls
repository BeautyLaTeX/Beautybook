%This Class is based on the default book class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Beautybook/Beautybook}[26-04-2022 v2.0 Beautybook Class]
\RequirePackage{kvoptions}%自定义选项宏包
\RequirePackage{etoolbox}%定制选项
% ---------------------------------- Default Options ----------------------------------------------%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt]{book}
%% Main packages in the document --- Some are imported later in the class file
%%----------------------------------宏包导入专栏-----------------------------------------------%%
\RequirePackage{xpatch}%修正章节编号
\RequirePackage[automark]{scrlayer-scrpage}%页面设置宏包,隶属于koma-script文档类
%%-------------------------------------------------------------------------------------------------%%
\RequirePackage[explicit,clearempty,pagestyles,newparttoc]{titlesec}%章节设计宏包
\RequirePackage{titletoc}%目录设计宏包
\setcounter{secnumdepth}{5}%增加编号深度
\setcounter{tocdepth}{2} %增加目录深度
\RequirePackage[dvipsnames,svgnames,x11names,table]{xcolor}%颜色宏包% Driver-independent color extensions
\RequirePackage{imakeidx} %索引宏包
\RequirePackage{tabularray}%LaTeX3表格宏包%目前最好的表格宏包
\RequirePackage{xfrac}%sfrac
\RequirePackage{expl3} %Latex3
\RequirePackage{xparse}
%%%%------------------------------------------------------------------------------%%%%
%%%%==================Math Font Setting===============%%%%
\RequirePackage{mtpro2}%数学字体样式宏包
\usepackage{amsfonts}
\DeclareFontFamily{U}{nxlmi}{}
\DeclareFontSubstitution{U}{nxlmi}{m}{it}
\DeclareFontShape{U}{nxlmi}{m}{it}{
    <-6.3>    nxlmi05
    <6.3-8.6> nxlmi07
    <8.6->    nxlmi0
}{}
\DeclareFontShape{U}{nxlmi}{b}{it}{
    <-6.3>    nxlbmi05
    <6.3-8.6> nxlbmi07
    <8.6->    nxlbmi0
}{}
\renewcommand{\partial}{{\text{\usefont{U}{nxlmi}{m}{it}\symbol{64}}\mspace{1mu}}}%重定义偏微分符号
%%%%==================Math Font Setting===============%%%%
%%%%------------------------------------------------------------------------------%%%%
\RequirePackage{xkeyval}
\RequirePackage[iso,english]{isodate} %使\today输出xxx-mm-dd日期样式
%%----------------------------------------宏包设置-------------------------------------------------%%
\ifodd\value{page}%奇数页
\RequirePackage[a4paper,top=2cm,bottom=2cm,left=1.5cm,right=2.4cm]{geometry}
\else  %偶数页
\RequirePackage[a4paper,top=2cm,bottom=2cm,left=2.4cm,right=1.5cm]{geometry}
\fi
%\RequirePackage[a4paper,left=2.4cm,right=2.4cm, bottom=2cm,top=2cm]{geometry}% 页面尺寸控制
\PassOptionsToPackage{quiet}{fontspec}%传递参数,以消除字体警告
\RequirePackage{anyfontsize}%字体尺寸控制
\RequirePackage{adforn}
\setlength\headheight{14.59804pt}
\everymath{\displaystyle}
%
\RequirePackage[title,titletoc,header]{appendix}%附录宏包
\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
\RequirePackage{zhlineskip} % 公式与正文间距修正
\RequirePackage{multicol}%分栏宏包
\RequirePackage{multirow}% Create tabular cells spanning multiple rows
\RequirePackage[nice]{nicefrac}
\RequirePackage{ninecolors}%颜色宏包% extra colors
\RequirePackage{algorithm}%代码样式宏包
\RequirePackage{rotating}
\RequirePackage{framed}
\RequirePackage{adjustbox}
\RequirePackage{witharrows}
\RequirePackage{subfiles}
\RequirePackage{bm}
\RequirePackage{mathtools}  % Mathematical tools to use with amsmath
\RequirePackage{tabularx}   % Tabulars with adjustable-width columns
\RequirePackage{siunitx}    % Comprehensive (SI) units package
\RequirePackage{times}
\RequirePackage{wrapfig}
\RequirePackage{niceframe}
\RequirePackage{mathrsfs}
\RequirePackage{ulem}
\normalem
\RequirePackage[english]{babel}
\RequirePackage[Symbol]{upgreek}
\RequirePackage{amsmath,amsthm}%
\RequirePackage{thmtools,thm-restate}%重写定理
\RequirePackage[colorlinks,
            pdfstartview=FitH,
            CJKbookmarks=true,
            bookmarksnumbered=true,
            bookmarksopen=true,
            linkcolor=purple5,
            filecolor=purple5,
            anchorcolor=purple5,
            linktocpage=true,
            urlcolor=purple5,
            citecolor=purple5,
            pdfencoding={auto},
			pdfauthor={ Shilong.Lu},pdfsubject={NoteBook},
			pdftitle={BeautyBook v2.0},pdfkeywords={notes,Graduate Test},
            breaklinks,
            unicode,
            linktoc=all,
            plainpages=false,
            pdfusetitle,
]{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref} %nameinlink ensures that the entire element is clickable in the pdf, not just the number
% Intelligent cross-referencing
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%%%%%%%%-------------------------------Tikz与Tcolorbox画图包--------------------------------------%%%%%%%%
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{tikz}
\tikzset{>=stealth}
\RequirePackage{tkz-fct}
\usetikzlibrary{calc,spy,arrows,shapes,intersections,fadings,,trees,mindmap,patterns,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,shadows, shadings,backgrounds,positioning,fit,arrows.meta}
\RequirePackage[most]{tcolorbox}%Most Important Package About The Establishment Of The Theorem Style
\tcbuselibrary{breakable, skins,theorems}%TcolorBox Library
\RequirePackage{tikzsymbols}
\RequirePackage{tikz-dimline}
\RequirePackage{tikz-cd}
\RequirePackage{tkz-euclide}
\RequirePackage[tikz]{bclogo}
\tikzset{%图和node文字一起缩放
	global scale/.style={
	scale=#1,
	every node/.append style={scale=#1}
	}
}
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%%%%%%%%-------------------------------Tikz与Tcolorbox画图包--------------------------------------%%%%%%%%
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
\RequirePackage{mdframed}%多样化盒子环境设计 %Multi-Style Boxs Design
\RequirePackage{booktabs}   % Publication quality tables
\RequirePackage{longtable}  % Allow tables to flow over page boundaries
%\RequirePackage{fancyhdr} % Control of page headers and footers
\RequirePackage{graphicx,tabularx} % Enhanced support for images
\RequirePackage{float}      % Improved interface for floating objects
\RequirePackage[edges]{forest}  %
\newcommand{\Captioncolor}{coverfgcolor} % 图片和表格题注文字颜色
\RequirePackage[labelfont={bf,color=\Captioncolor},justification=centering,normalsize]{caption} % Captions
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}
\RequirePackage{subcaption} % Support for sub-captions
\RequirePackage{pdfpages}   % Include PDF documents
\RequirePackage{ twemojis}  %Provide emojis
\AtBeginDocument{
	\setlength{\abovedisplayskip}{4pt} %---------------------公式上间距
	\setlength{\belowdisplayskip}{4pt} %---------------------公式下间距
	\RequirePackage[flushmargin,stable]{footmisc}
	\setlength{\footnotesep}{12pt}
}
\RequirePackage{xspace}         % Define commands that appear not to eat spaces
\RequirePackage{microtype}   % Refinements towards typographical perfection
\RequirePackage{extarrows}    %带文字箭头
\RequirePackage{enumitem}   %定制列表样式% Control layout of itemize, enumerate, description
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parsep,topsep=5pt,font=\normalfont,leftmargin=*,label=(\arabic*)}%可以增加fullwidth,选项
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parsep,topsep=5pt,font=\normalfont,leftmargin=*,label=\color{azure4}$\bullet$}
\setdescription[1]{itemsep=0pt,partopsep=0pt,parsep=\parsep,topsep=5pt,font=\normalfont}
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage{apptools}
\RequirePackage{etoolbox}   % Toolbox of programming facilities
\RequirePackage{iftex}          % Adds if-else statements to support multiple compilers 加入判断函数if-else-fi
\RequirePackage{datetime}   % Change format of \today
\RequirePackage{IEEEtrantools,nicematrix} %特殊数学公式环境和矩阵环境
\RequirePackage{Beautybook/Packages/eqnalign}%外部导入
\RequirePackage[physics]{Beautybook/Packages/physicx}%外部导入
\RequirePackage{Beautybook/Packages/ascolorbox}%外部导入
%%%%%% Define some useful colors %%%%%%%%
\definecolor{deepBlue}{RGB}{61,124,222}
\definecolor{lightergray}{gray}{0.99}
\definecolor{Beige}{RGB}{245,245,220}
\definecolor{Rhodamine}{RGB}{239,84,159}
\definecolor{Magenta}{RGB}{236,0,141}
\definecolor{RubineRed}{RGB}{236,2,126}
\definecolor{DarkCyan}{RGB}{0, 140, 140}
\definecolor{RedViolet}{RGB}{160,34,108}
\definecolor{finegray}{RGB}{248,248,245}
\definecolor{structurecolor}{RGB}{236,2,126}
%%%%%% Define some useful colors %%%%%%%%
%% ----Defining commands for the cover image, subtitle, subject, affiliation and table of authors----%%
%%----------------------------------封面信息定义--------------------------------------------------------%%
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\press[1]{\def\@press{#1}}
\newcommand*\editor[1]{\def\@editor{#1}}
\newcommand*\version[1]{\def\@version{#1}}
\newcommand*\motto[1]{\def\@motto{#1}}
\newcommand*\coverequation[1]{\def\@coverequation{#1}}
\newcommand*\coverimage[1]{\def\@coverimage{#1}}
\newcommand*\covertikz[1]{\def\@covertikz{#1}}
\newcommand*\coverlogo[1]{\def\@coverlogo{#1}}
%%----------------------------------封面信息定义--------------------------------------------------------%%
%Part插图
\newcommand*\partimage[1]{\def\@partimage{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% I. Loading the fonts %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifPDFTeX
    %% pdfLaTeX is available for compatibility and uses a Paletino-like font
    \RequirePackage[T1]{fontenc}  % Selecting T1 font encoding
	\RequirePackage[utf8]{inputenc}
    \RequirePackage{times}    % Palatino-like font...
    %% Another font can be used as the large title style font if desired
    \def\largetitlestyle{\normalfont}
    \newcommand{\xingkai}{\sc}
    \newcommand{\zhdbs}{\bf}
    \newcommand{\kaiti}{\itshape}
    \newcommand*{\fangsong}{\sc} % 仿宋
    \newcommand*{\lishu}{\scshape}    % 隶书
    %% Warning when using pdfLaTeX
    %\@latex@warning@no@line{You are using pdfLaTeX as the compiler. You can safely ignore this warning or consider changing the compiler to XeLaTeX or LuaLaTeX to adhere to the Beautybook style.}
\else %%XeLaTex Or LuaLaTex Fonts Set
    %% If XeLaTeX or LuaLaTeX is set as the compiler, the Beautybook style fonts are used
    %\RequirePackage{mathspec}  % Advanced Math Font Setting Package
    \RequirePackage{fontspec} % Advanced font selection
    \usepackage[fontset=none]{ctex}
    %%%%%%%%%英文字体设置%%%%%%%%%%%%
    \setmainfont{Times New Roman}%设置英文正文字体样式
    \setsansfont{Arial}% 设置英文\sffamily
    \setmonofont{Latin Modern Mono}
    %\setmathsf{Times New Roman} %数学字体\sffamily
    %\setmathtt{Times New Roman} %数学字体\ttfamily
    %%%%==============================================================%%%%
    %%                                                                    数学字体设置窗口                                                                            %%
    %%%%==============================================================%%%%
    %\setmathsfont(Digits,Latin,Greek)[Numbers={Lining,Proportional}]{Minion Pro} %%Adobe Math Fonts Family
    %%%%%=====================数学字体设置======================%%%%%%
    % \usepackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
    %\setmainfont
%    [    Extension = .otf,
%      UprightFont = *-Regular,
%          BoldFont = *-Bold,
%        ItalicFont = *-Italic,
%    BoldItalicFont = *-BoldItalic,
%    ]
%    {XITS}
    % \setmathfont[Extension = .otf]{XITSMath-Regular} %\setmathfont为源自于Unicode-Math宏包的命令 (功能)
	% \setmathfont[range=bb]{TeX Gyre Termes Math} %定义\mathbb的字体,原字体XITSMath的\mathbb太丑,无法接受,遂换回原来的
    %重定义数学符号命令
    %重设\sum符号
    % \DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}
    % \DeclareMathSymbol{\msum}{\mathop}{largesymbols}{"50}
    % %重设\pi符号
    % \DeclareSymbolFont{letters}{OML}{cmm}{m}{it}
    % \DeclareMathSymbol{\mpi}{\mathord}{letters}{"19}
    % %更新命令
    % \renewcommand{\boldsymbol}{\symbf}
    % \renewcommand{\mathscr}{\symscr}
    %%%%==============================================================%%%%
    %%                                                                   数学字体设置 窗口                                                                            %%
    %%%%==============================================================%%%%

    %%%%%%%%%%%%中文字体设置%%%%%%%%%%%
    \setCJKmainfont[Path=Beautybook/fonts/chinesefonts/,BoldFont={FZFWZhuZiMinchoE.TTF},ItalicFont={FZXKTJW.TTF},SlantedFont = {FZXKK.TTF} , SlantedFeatures = {FakeSlant}]{FZXSSJW.TTF}
    \setCJKsansfont[Path=Beautybook/fonts/chinesefonts/,BoldFont={FZBaoHTJW_Cu.TTF},ItalicFont={FZXKK.TTF}]{FZBaoHTJW.TTF}
    \setCJKmonofont[Path=Beautybook/fonts/chinesefonts/,BoldFont={FZZHK.TTF},ItalicFont={FZHanSTJW.TTF}]{FZPingXYSJW.TTF}
    \newCJKfontfamily[song]\songti{FZXSSJW.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[hei]\heiti{FZBaoHTJW.TTF}[Path=Beautybook/fonts/chinesefonts/] %宝黑体
    \newCJKfontfamily[kai]\kaiti{FZXKTJW.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[fs]\fangsong{FZQingFSJW_Cu.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[liti]\lishu{方正隶书简体.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[ZhuZiMinchoE]\songE{FZFWZhuZiMinchoE.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[ZhuZiMinchoD]\songD{FZFWZhuZiMinchoD.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[xk]\xingkai{FZXKK.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    \newCJKfontfamily[zhdbs]\dbs{FZDBSK.TTF}[Path=Beautybook/fonts/chinesefonts/] %宋体
    %%%%%%%%%%%%中文字体设置%%%%%%%%%%%
    \newfontfamily\largetitlestyle[Path=Beautybook/fonts/chinesefonts/]
	{FZFWZhuZiMinchoE.TTF}
    \newfontfamily\quotefont{Georgia}
    \RequirePackage{zhnumber}
    %% Changing the quote environment to use Georgia
    \AtBeginEnvironment{quote}{\quotefont}
	%图表目录样式
	\titlecontents{figure}[12mm]{\kaiti}{\contentslabel[\heiti 图~\thecontentslabel]{12mm}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
    \titlecontents{table}[12mm]{\kaiti}{\contentslabel[\heiti 表~\thecontentslabel]{12mm}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\fi
\RequirePackage{biblatex}
\RequirePackage{csquotes}
\addbibresource[location=local]{Beautybook/ref.bib} %参考文献文件


%%%%%=====================目录设置======================%%%%%%
\def\TitleFontStyle{\color{white}\fontsize{15}{15}\selectfont}
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%%%%%%%%--------------------------------------TOC Design---------------------------------------------%%%%%%%%
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%\RequirePackage{tocloft} %目录定制宏包
%\tikz[overlay] \shade[left color=LightSkyBlue,right color=white,] (0,-1ex) rectangle (\textwidth,1em);
%\titlecontents{标题名}[左间距]{标题格式}{标题标志}{无序号标题}{指引线与页码}[下间距]

%----------------------------------Part Toc----------------------------------------%
\ifPDFTeX
\def\PartName{PART~ \thecontentslabel}
\else
\def\PartName{第~\zhnumber{\thecontentslabel} ~部分}
\fi
% Styling of numbered parts in the table of contents
\newcommand{\tocentrypartnumbered}[1]{%
    \begin{tikzpicture}[remember picture,overlay]
    \shade[rectangle,yshift=-.5cm,xshift=-.2cm,rounded corners=0pt,left color=outermarginbgcolor!80,right color=outermarginbgcolor!10,] (0,0) rectangle (\paperwidth-1.85\outermarginwidth,.85cm);
    \coordinate (parttoctitle) at (2.2cm,-.8mm);
    \node[right] at (parttoctitle) {\Large\sffamily\color{outermarginfgcolor}#1};
    \shade[rectangle,xshift=1.5cm,yshift=-.5cm,rounded corners=0pt,bottom color=outermarginbgcolor!20,top color=outermarginfgcolor!80,drop shadow={color=black!40!white,opacity=.3,shadow xshift=.08cm,shadow yshift=0cm}] (5mm,0) rectangle (7mm,.85cm);
    \node[left,rectangle, %opacity=.3,
        text=white,minimum height=0.85cm,
        drop shadow={opacity=.3, color=black!40!white,shadow xshift=0.06cm,shadow yshift=-0.06cm},
        inner sep=1mm,fill=outermarginfgcolor,
                    %anchor=west,
        rounded corners=0pt,
        font=\rmfamily\Large\bfseries] at
        (1.85cm,-.8mm)
        { \PartName};
    \end{tikzpicture}
}

% Styling of unnumbered parts in the table of contents
\newcommand{\tocentrypartunnumbered}[1]{%
    \begin{tikzpicture}[remember picture,overlay]
    \shade[rectangle,yshift=-.5cm,xshift=-.2cm,rounded corners=0pt,left color=outermarginbgcolor!80,right color=outermarginbgcolor!10,] (0,0) rectangle (\paperwidth-1.85\outermarginwidth,.85cm);
    \coordinate (parttoctitle) at (-.1cm,-.8mm);
    \node[right] at (parttoctitle) {\Large\sffamily\color{outermarginfgcolor}#1};
    \shade[rectangle,xshift=-.8cm,yshift=-.5cm,rounded corners=0pt,top color=outermarginfgcolor!80,bottom color=outermarginbgcolor!20,drop shadow={color=black!40!white,opacity=.3,shadow xshift=.08cm,shadow yshift=0cm}] (5mm,0) rectangle (7mm,.85cm);
    \end{tikzpicture}
}

\titlecontents{part} % Section type being modified
	[4pt] % Left indentation
	{\Large\rmfamily\bfseries\hypersetup{linkcolor=outermarginfgcolor}} % Before code
	{\tocentrypartnumbered} % Formatting of numbered sections of this type
	{\tocentrypartunnumbered} % Formatting of numberless sections of this type
	{\titlerule*[1000pc]{$\cdot$}\raisebox{-2.5mm}{\contentspage}\hspace*{0cm}\vspace*{.7ex}} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\ifPDFTeX
\def\ChapterName{\MakeUppercase{\large\chaptername\  ~\thecontentslabel}}
\else%%---------------------XeLaTeX Or LuaLaTeX-------------------------%%
\def\ChapterName{ 第~ \zhnumber{\thecontentslabel}~章} %
\fi%--%
%%---------------------------------------CHAPTER TOC STYLE--------------------------------------%%
\titlecontents{chapter}%标题名
            [30pt]%左间距
            {\bf \large\addvspace{1pc}\hypersetup{linkcolor=outermarginfgcolor}}%标题格式
            {\contentsmargin{0pt}%
            \tikz[overlay] \shade[left color=outermarginbgcolor!80,right color=outermarginbgcolor!10!white,rounded corners=1pt] (-2.5em,-1ex) rectangle (.95\textwidth,1em);%
            \hspace*{-30pt}\raisebox{-.8ex}{\begin{tikzpicture}[remember picture]
                \node[rectangle, %opacity=.3,
                    text=white,minimum height=1em+1ex,
                    drop shadow={opacity=.3, color=black!40!white,shadow xshift=0.06cm,shadow yshift=-0.06cm},
                    inner sep=1mm,fill=outermarginfgcolor,
                    %anchor=west,
                    rounded corners=1pt,
                    font=\normalsize] at (0,0) {\ChapterName};
            \end{tikzpicture}}\hspace*{3pt}%
            \tikz[overlay] \shade[top color=outermarginfgcolor!70!white,bottom color=outermarginfgcolor!20!white,rounded corners=.3pt] (0,-1ex) rectangle (2.4pt,1em);%
            \hspace*{5pt}%
            }%标题标志
            {\sffamily\contentsmargin{0pt}\hspace*{-25pt}}%无序号标题
            {\titlerule*[1000pc]{$\cdot$}\contentspage\hspace*{0cm}\vspace*{.7ex}}  %指引线与页码
%%-----------------------------------------CHAPTER TOC STYLE---------------------------------------%%

%%---------------------------------------------------------Section TOC Design-----------------------------------------%%
\titlecontents{section}
			[35pt]
			{\normalsize\hypersetup{linkcolor=outermarginfgcolor}}%
			{\contentslabel{1.7em}}%
			{}%
			{\titlerule*[0.3pc]{$\cdot$}\contentspage\hspace*{0cm}\vspace*{.5ex}}%
%%------------------------------------------------------Subsection TOC Design----------------------------------------%%
\titlecontents{subsection}
			[55pt]
			{\small\hypersetup{linkcolor=outermarginfgcolor}}%
			{\contentslabel{2.5em}}%
			{}%
			{\titlerule*[0.3pc]{$\cdot$}\contentspage\hspace*{0cm}\vspace*{.3ex}}%

%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%%%%%%%%-------------------------------------- TOC Design ---------------------------------------------%%%%%%%%
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%%%%%%%%----------------------------------- SIDE BAR Design -----------------------------------------%%%%%%%%
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
\setlength\headheight{27pt}
\setlength\footheight{26pt}

\renewcommand\chaptermarkformat{}
% define a new mark for the chapter number
\newmarks\chapternum
\xapptocmd\chaptermark{\marks\chapternum{\thechapter}}{}{\PatchFailed}

\newmarks\secnum
\xapptocmd\sectionmark{\marks\secnum{\thesection}}{}{\PatchFailed}

\newlength\outermarginwidth
\setlength\outermarginwidth{2cm}
\newlength\chapternumbersize
\setlength\chapternumbersize{50pt}

\colorlet{outermarginbgcolor}{lightgray}
\colorlet{outermarginfgcolor}{darkgray}

%%============================页脚页码=================================%%
\newcommand*\outermarginpagemark{%
	\ifodd\value{page}\else\hfill\fi%
	\tikz[overlay]
		\node[circle,fill=outermarginfgcolor,text=white,font=\bfseries,minimum size=6mm]
		{\thepage};%页脚页码
}
%%============================页脚页码=================================%%
\newlength\baryshift
%%============================偶数页页边章节编号==============================%%
\makeatletter
% New % Add A Side-Bar Box For The Chapter Number
\newcommand*\outermarginchapternumberbox{%
    \ifodd\value{page}\else\hfill\fi%
    \if@mainmatter
    \begin{tikzpicture}[remember picture,overlay]
        \shade[rectangle,drop shadow={opacity=.3, color=black!40!white,shadow xshift=0.06cm,shadow yshift=-0.06cm},
            top color=outermarginfgcolor!90,bottom color=outermarginfgcolor!20
        ] (-\outermarginwidth,-1\outermarginwidth) rectangle (0,-2\outermarginwidth);
        \node[anchor=center,text=white,font=\rmfamily\bfseries] at (-1/2*\outermarginwidth,-1.5\outermarginwidth) {\usekomafont{chapternumber}{\botmarks\chapternum}};%
        \shade[rounded corners=1pt,left color=outermarginfgcolor!90,right color=outermarginfgcolor!20,xshift=-\outermarginwidth,yshift=\baryshift]  (0,1em) rectangle +(\outermarginwidth,1em);%
    \end{tikzpicture}%
    \fi
    \vfill
}%
\makeatother
%--------------------------------------------------------------------------------------------------------------------------------------%

%%============================奇数页边章节编号==============================%%
\makeatletter
% New % Add A Side-Bar Box For The Chapter Number
\newcommand*\oddoutermarginchapternumberbox{%
    \ifodd\value{page}\else\hfill\fi%
    \if@mainmatter
    \begin{tikzpicture}[remember picture,overlay]
    \shade[rectangle,drop shadow={opacity=.3, color=black!40!white,shadow xshift=0.06cm,shadow yshift=-0.06cm},
            top color=outermarginfgcolor!90,bottom color=outermarginfgcolor!20
        ] (\outermarginwidth,-1\outermarginwidth) rectangle (0,-2\outermarginwidth);
        \node[anchor=center,text=white,font=\rmfamily\bfseries] at (1/2*\outermarginwidth,-1.5\outermarginwidth) {\usekomafont{chapternumber}{\botmarks\chapternum}};%
        \shade[rounded corners=1pt,left color=outermarginfgcolor!90,right color=outermarginfgcolor!20,xshift=0cm,yshift=\baryshift]  (0,1em) rectangle +(\outermarginwidth,1em);%
    \end{tikzpicture}%
    \fi
    \vfill
}%
\makeatother
%--------------------------------------------------------------------------------------------------------------------------------------%

\newkomafont{chapternumber}{%页边章节编号字体
	\fontsize{\chapternumbersize}{\chapternumbersize}\selectfont
}%
%--------------------------------------------------------------------------------------------------------------------------------------%
%%===========================页边章节编号================================%%


%%============================页边条及章节名称=================================%%
\makeatletter
\newcommand\outermarginmark{
	\ifodd\value{page}\hfill\else\hspace*{\dimexpr\outermarginwidth*3/8\relax}\fi
	\rotatebox{90}{\parbox{\layerheight}{%页边章节名称
		\raggedleft
		\usekomafont{outermargin}{%
		\MakeMarkcase{\ifodd\value{page}\odd@outermargin\else\even@outermargin\fi}}%
	}}%
	\ifodd\value{page}\hspace*{\dimexpr\outermarginwidth*3/8\relax}\fi%
}
\newcommand*\even@outermargin{}
\newcommand*\odd@outermargin{}
\newcommand*\evenoutermargin[1]{\renewcommand\even@outermargin{#1}}% 偶数页内容
\newcommand*\oddoutermargin[1]{\renewcommand\odd@outermargin{#1}}% 奇数页内容
\makeatother
%
\newkomafont{outermargin}{%页边章节名称字体
	\sffamily\bfseries\fontsize{15}{15}\selectfont\color{outermarginfgcolor}
}%
%%============================页边条=================================%%

% declare new page style using layers
\DeclareNewPageStyleByLayers{scth}{%
	scth.outermargin.bg.even,%
	scth.outermargin.bg.odd,%
    scth.outermargin.fg.even,%
    scth.outermargin.fg.odd,%
	scth.outermargin.pn.even,%
	scth.outermargin.pn.odd,%
	scth.outermargin.cn.even,%
    scth.outermargin.cn.odd,%
	scth.outermargin.text.even,%
	scth.outermargin.text.odd%
}

% define the layers for even pages

%%==============偶数页页边条颜色========================%%
\DeclareNewLayer[
	background, % 下层(背景)
	evenpage,
	outermargin,
	width=\outermarginwidth,
	contents={\color{outermarginbgcolor}\rule{\layerwidth}{\layerheight}} %色彩装饰条
]{scth.outermargin.bg.even}%
%%%%%===================================================%%%%%
%%=============%                 页边条颜色              %=======================%%
%%%%%===================================================%%%%%
\tikzfading[name=fade south,
                    top color =transparent!0,
                    bottom color=transparent!80]
\tikzfading[name=fade north,
                    top color =transparent!100,
                    bottom color=transparent!0]
%偶数页边纹理效果设置
\newcommand{\evensidbardeepcolor}{%
\begin{tikzpicture}[remember picture,overlay] %
    \fill [outermarginfgcolor!20]%
     (current page.north west) rectangle ([xshift=\outermarginwidth,yshift=0]current page.south west);
    \pattern [pattern=checkerboard,pattern color=outermarginfgcolor!50]%
     (current page.north west) rectangle ([xshift=\outermarginwidth,yshift=0]current page.south west);
    \fill [outermarginbgcolor!90,path fading=fade south]%
     ([yshift=1mm]current page.north west) rectangle ([xshift=\outermarginwidth,yshift=-.5\layerheight]current page.north west);
     \fill [outermarginbgcolor,path fading=fade north]%
     (current page.south west) rectangle ([xshift=\outermarginwidth,yshift=.2\layerheight]current page.south west);
\end{tikzpicture}
}
%偶数页边纹理效果设置
\newcommand{\oddsidbardeepcolor}{%
\begin{tikzpicture}[remember picture,overlay] %
  \fill [outermarginfgcolor!20]%
    (current page.north east) rectangle ([xshift=-\outermarginwidth,yshift=0]current page.south east);
  \pattern [pattern=checkerboard,pattern color=outermarginfgcolor!50]%
    (current page.north east) rectangle ([xshift=-\outermarginwidth,yshift=0]current page.south east);
  \fill [outermarginbgcolor!90,path fading=fade south]%
    ([yshift=1mm]current page.north east) rectangle ([xshift=-\outermarginwidth,yshift=-.5\layerheight]current page.north east);
    \fill [outermarginbgcolor,path fading=fade north]%
    (current page.south east) rectangle ([xshift=-\outermarginwidth,yshift=.2\layerheight]current page.south east);
\end{tikzpicture}
}
%%==============偶数页页边条颜色========================%%
\DeclareNewLayer[
	foreground, %
	evenpage,
	outermargin,
	width=\outermarginwidth,
	contents=\evensidbardeepcolor %色彩装饰条
]{scth.outermargin.fg.even}%
%%==============偶数页页边条颜色========================%%

%%==============奇数页页边条颜色========================%%
\DeclareNewLayer[
	foreground, %
	oddpage,
	outermargin,
	width=\outermarginwidth,
	contents=\oddsidbardeepcolor %色彩装饰条
]{scth.outermargin.fg.odd}%
%%==============奇数页页边条颜色========================%%

%%%%%===================================================%%%%%
%%=============%                 页边条颜色              %=======================%%
%%%%%===================================================%%%%%

%%==============偶数页页脚页码========================%%
\DeclareNewLayer[
	foreground, %上层 (背景之上)
	evenpage,
	foot, % 页脚
	hoffset=0pt,
	width=\outermarginwidth,
	contents=\outermarginpagemark
]{scth.outermargin.pn.even}%
%%==============偶数页页脚页码========================%%

%%==============偶数页章节编号========================%%
\DeclareNewLayer[
	foreground, %上层 (背景之上)
	evenpage,
	head, %页眉
	hoffset=0pt,
	width=\outermarginwidth,
	align=t,
	addvoffset=\dimexpr-\chapternumbersize-12pt+\headheight\relax,
	height=\chapternumbersize+\headheight,
	contents=\outermarginchapternumberbox%章节编号
]{scth.outermargin.cn.even}%
%%==============偶数页章节编号========================%%

%%==============奇数页章节编号========================%%
\DeclareNewLayer[
	foreground, %上层 (背景之上)
	oddpage,
	head, %页眉
	hoffset=\paperwidth,
	width=\outermarginwidth,
	align=r,
	addvoffset=\dimexpr-\chapternumbersize-12pt+\headheight\relax,
	height=\chapternumbersize+\headheight,
	contents=\oddoutermarginchapternumberbox %章节编号
]{scth.outermargin.cn.odd}%
%%==============奇数页章节编号========================%%

%%======================章节名称===================================%%
\newlength\chapterNameheight
\DeclareNewLayer[
	clone=scth.outermargin.cn.even,
	addheight=\dimexpr\headheight+\headsep+\textheight\relax,
    addvoffset=\dimexpr+\chapterNameheight\relax,
	contents=\outermarginmark %
]{scth.outermargin.text.even}%
%%======================章节名称===================================%%


% define the layers for odd page from the settings for even pages
\newcommand*\DeclareOddFromEven[1]{%复制自偶数页样式命令
\DeclareNewLayer[
	clone=#1.even,
	oddpage,
	align=r,
	hoffset=\paperwidth
]{#1.odd}%
}
\DeclareOddFromEven{scth.outermargin.bg}
\DeclareOddFromEven{scth.outermargin.pn}
\DeclareOddFromEven{scth.outermargin.text}



% add the layers to page style scrheadings and page style plain
\ForEachLayerOfPageStyle*{scth}{%
	\AddLayersToPageStyle{scrheadings}{#1}%
	\AddLayersToPageStyle{plain.scrheadings}{#1}%
}
%----------------------------------------------
% header and footer contents settings
\newcommand{\Footname}{Sillia Mi Moore Fanyare}
\newcommand{\FootName}[1]{\renewcommand{\Footname}{#1}}
%\useshapeofkomafont{pageheadfoot}{\itshape}
\KOMAoptions{markcase=upper} %页眉
% for page styles scrheadings and plain
\clearpairofpagestyles
\newlength\hdheight %页眉高度
\rehead{% 偶数页眉右边
\begin{tikzpicture}[overlay, remember picture]%
   \shade[left color=outermarginbgcolor!90,right color=outermarginbgcolor!20]  (current page.north west) rectangle ($(current page.north east)+(0,-\hdheight)$);%
   \node[anchor=north east, text=outermarginbgcolor!80, font=\fontsize{1.8cm}{5cm}\selectfont] (section) at ([xshift=-1.6*\hdheight,yshift=-1/10*\hdheight]current page.north east) {\botmarks\secnum};%
   \node[anchor=north west,font=\rmfamily\bfseries\fontsize{.5cm}{.8cm}\selectfont,text=outermarginfgcolor!70] at ($([xshift=.4\paperwidth]current page.north west)+(0,-.6\hdheight)$) {\bf\rightmark};%
   \shade[rectangle,left color=outermarginfgcolor!70,right color=outermarginfgcolor!20,rounded corners=1pt,drop shadow={color=black!30!white,opacity=.3,shadow xshift=.05cm,shadow yshift=-.05cm}]  ($([yshift=-\hdheight,xshift=-\outermarginwidth]current page.north west)$) rectangle ($([yshift=-1.02\hdheight]current page.north east)$);%
   \shade[rectangle,left color=outermarginbgcolor!90,right color=outermarginbgcolor!20,rounded corners=1pt,drop shadow={color=black!30!white,opacity=.3,shadow xshift=.05cm,shadow yshift=-.05cm}]  ($([yshift=-1.02\hdheight,xshift=-\outermarginwidth]current page.north west)$) rectangle ($([yshift=-1.2\hdheight]current page.north east)$);%
\end{tikzpicture}
}
\lohead{% 奇数页眉左边
\begin{tikzpicture}[overlay, remember picture]%
    \shade[right color=outermarginbgcolor!90,left color=outermarginbgcolor!20]  (current page.north west) rectangle ($(current page.north east)+(0,-\hdheight)$);%
   \node[align=right, anchor=north west, text=outermarginbgcolor!80, font=\fontsize{1.8cm}{5cm}\selectfont] (section) at ([xshift=1/8*\hdheight,yshift=-1/10*\hdheight]current page.north west) {\botmarks\secnum};%
   \node[align=right, anchor=north east,font=\rmfamily\bfseries\fontsize{.5cm}{.8cm}\selectfont,text=outermarginfgcolor!70] at ($([xshift=.6\paperwidth]current page.north west)+(0,-.6\hdheight)$) {\bf\rightmark};%
   \shade[rectangle,right color=outermarginfgcolor!70,left color=outermarginfgcolor!20,rounded corners=1pt,drop shadow={color=black!30!white,opacity=.3,shadow xshift=.05cm,shadow yshift=-.05cm}]  ($([yshift=-\hdheight]current page.north west)$) rectangle ($([yshift=-1.02\hdheight,xshift=-\outermarginwidth]current page.north east)$);%
   \shade[rectangle,right color=outermarginbgcolor!90,left color=outermarginbgcolor!20,rounded corners=1pt,drop shadow={color=black!30!white,opacity=.3,shadow xshift=.05cm,shadow yshift=-.05cm}]  ($([yshift=-1.02\hdheight]current page.north west)$) rectangle ($([yshift=-1.2\hdheight,xshift=-\outermarginwidth]current page.north east)$);%
\end{tikzpicture}
}
\cfoot{}%\pagemark 页脚页码
\ofoot{\Footname} %
% set the contents of the outer margin on even and odd pages for scrheadings, plain and scth
%\evenoutermargin{内容} %even偶数页
\oddoutermargin{\bf\leftmark} % Odd 奇数页
\evenoutermargin{\bf\leftmark} % Even 偶数页

\definecolor{lightblue}{RGB}{199,232,250}
\definecolor{darkblue}{RGB}{59,134,215}

\colorlet{outermarginbgcolor}{lightblue}
\colorlet{outermarginfgcolor}{darkblue}

%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%
%%%%%%%%----------------------------------- SIDE BAR Design -----------------------------------------%%%%%%%%
%%%%%%%%%%%%========================================%%%%%%%%%%%%%%%%%

%%-----------------------------------------------------------------------------------------------------%%
%%%%%%%%%%%%自定义命令%%%%%%%%%
%高亮选中字词 (直接选用了tcolorbox宏包中出现的的示例)
\newtcbox{\embox}[1][red]{%
	on line, arc = 0.5pt, outer arc = 1pt,%arc设置内弧半径；outer arc设置外弧半径
	colback = #1!15!white, colframe = #1!50!black,
	boxsep = 0pt, left = 1pt, right = 1pt, top = 2pt, bottom = 2pt,
	boxrule = 0pt, bottomrule = 1pt, toprule = 1pt}
%
\ifPDFTeX
\newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
\newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
\newcommand{\thmref}[1]{{\sc Theorem \ref{#1}}}
\renewcommand{\eqref}[1]{{\sc Equation  (\ref{#1})}}
\newcommand{\lemref}[1]{{\sc Lemma \ref{#1}}}
\newcommand{\defref}[1]{{\sc Definition \ref{#1}}}
\newcommand{\proref}[1]{{\bf Property \ref{#1}}}
\newcommand{\propref}[1]{{\sc Proposition \ref{#1}}}
\newcommand{\corref}[1]{{\sc Corollary \ref{#1}}}
\newcommand{\examref}[1]{{\sc Example \ref{#1}}}
\newcommand{\exerref}[1]{{\sc Exercise \ref{#1}}}
\else%%---------------------------------------------------%%
\newcommand\figref[1]{\textbf{图}~\ref{#1}}
\newcommand\tabref[1]{\textbf{表}~\ref{#1}}
\newcommand{\thmref}[1]{{\bf 定理 \ref{#1}}}
\renewcommand{\eqref}[1]{{\bf 式  (\ref{#1})}}
\newcommand{\lemref}[1]{{\bf 引理 \ref{#1}}}
\newcommand{\defref}[1]{{\bf 定义 \ref{#1}}}
\newcommand{\proref}[1]{{\bf 性质 \ref{#1}}}
\newcommand{\propref}[1]{{\bf 命题 \ref{#1}}}
\newcommand{\corref}[1]{{\bf 推论 \ref{#1}}}
\newcommand{\examref}[1]{{\bf 例题 \ref{#1}}}
\newcommand{\exerref}[1]{{\bf 练习 \ref{#1}}}
\def\equationautorefname{\bf 式}%
\def\footnoteautorefname{\bf 脚注}%
\def\itemautorefname{{\bf 项}}%
\def\figureautorefname{\bf 图}%
\def\tableautorefname{\bf 表}%
\def\Examautorefname{\bf 例}%
\def\partautorefname{\bf 篇}%
\def\appendixautorefname{\bf 附录}%
\def\chapterautorefname{\bf 章}%
\def\sectionautorefname{\bf 节}%
\def\subsectionautorefname{\bf 小小节}%
\def\subsubsectionautorefname{\bf Subsubsection}%
\def\paragraphautorefname{\bf 段落}%
\def\subparagraphautorefname{\bf 子段落}%
\def\FancyVerbLineautorefname{\bf 行}%
\fi
%
%特殊注释矩阵
\newcommand\coolover[2]{\mathrlap{\smash{\overbrace{\phantom{%
					\begin{matrix} #2 \end{matrix}}}^{\mbox{$#1$}}}}#2}

\newcommand\coolunder[2]{\mathrlap{\smash{\underbrace{\phantom{%
					\begin{matrix} #2 \end{matrix}}}_{\mbox{$#1$}}}}#2}

\newcommand\coolleftbrace[2]{%
	#1\left\{\vphantom{\begin{matrix} #2 \end{matrix}}\right.}

\newcommand\coolrightbrace[2]{%
	\left.\vphantom{\begin{matrix} #1 \end{matrix}}\right\}#2}
%
\newenvironment{shrinkeq}[1]%缩减公式与正文间距环境
{\bgroup
\addtolength\abovedisplayshortskip{#1}
\addtolength\abovedisplayskip{#1}
\addtolength\belowdisplayshortskip{#1}
\addtolength\belowdisplayskip{#1}}
{\egroup\ignorespacesafterend}
%%%%%%%
\newcommand{\case}[5]{#1=\begin{cases}
	#2,&#3;\\
	#4,&#5.
\end{cases}}
\newcommand{\summ}[2]{\sum_{#1}^{#2}}
\newcommand {\limto}[2]{\lim_{#1 \to #2}}
\newcommand{\into}[4]{\int_{#1}^{#2}#3\dd #4}
\newcommand{\pr}{^\prime}
\newcommand{\prr}{^{\prime\prime}}
\newcommand{\prrr}{^{\prime\prime\prime}}
\newcommand{\zhkuohao}[1]{\left[#1\right]}
\newcommand{\dakuohao}[1]{\left\{#1\right\}}
\newcommand{\kuohao}[1]{\left(#1\right)}
\newcommand{\model}[1]{\left\lVert #1 \right\rVert}
\newcommand{\1}{^{-1}}
\newcommand{\emb}[2][Magenta]{{\bf\color{#1}\uuline{#2}}}
\newcommand{\colortext}[2][red]{{\bf \color{#1} #2 }}
\newcommand{\prn}[1]{^{(#1)}}
\newcommand{\li}{\lim_{n\to\infty}}
\newcommand{\A}{\mathcal{A}}
%--------------------------使用罗马字母-------------------------%
\newcommand{\rmn}[1]{\romannumeral #1}
\newcommand{\Rmn}[1]{\uppercase\expandafter{\romannumeral #1}}
\newcommand{\fa}{\forall\;}
\newcommand{\ex}{\exists\;}
\newcommand{\B}{\mathcal{B}}
\RequirePackage{emptypage} % Remove header and footer on empty pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% II. Adjusting the layout of the titles in the text and table of contents %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifPDFTeX
\newcommand{\introductionname}{Introduction}
\else%%-----------------------------------------------%%
\newcommand{\introductionname}{章~节~摘~要}
\fi
%% Formatting chapter titles and spacing% 标题样式
%%-----------------------------------------------%%
%%%%%%%章节标题样式开始%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\chapnumfont{\color{outermarginfgcolor}\fontsize{50}{60}\selectfont}
\newcommand\chapnamefont{\color{outermarginfgcolor}\bf\huge}
\newcommand\chaptitlefont{\color{outermarginfgcolor}\bfseries\fontsize{30}{40}\selectfont}
\newlength\ChapterBackGroundHeight
\ifPDFTeX
\newcommand{\TheContentsName}{The Contents Of Chapter~\thechapter}
\else
\newcommand{\TheContentsName}{第~\thechapter~章目录}
\fi

%%--------------------------------------------Chapter----------------------------------------------------%%
\makeatletter
\titleformat{\chapter}
	{\startcontents\bfseries\rmfamily\filcenter}
	{}
	{0pt}
	{}
	[{%
    \ifodd\value{page}
    \tikz[remember picture,overlay]\shade[rectangle,left color=outermarginbgcolor!10,middle color=outermarginbgcolor!50,right color=outermarginfgcolor!20,rounded corners=5pt,drop shadow={opacity=.3,color=black!20!white,xshift=-.05cm,yshift=-.05cm}] ([xshift=2pt]current page.north west) rectangle ([xshift=-1.08\outermarginwidth,yshift=-\ChapterBackGroundHeight]current page.north east);%
    \else
    \tikz[remember picture,overlay]\shade[rectangle,left color=outermarginfgcolor!20,middle color=outermarginbgcolor!50,right color=outermarginbgcolor!10,rounded corners=5pt,drop shadow={opacity=.3,color=black!20!white,xshift=.05cm,yshift=-.05cm}] ([xshift=-2pt]current page.north east) rectangle ([xshift=1.08\outermarginwidth,yshift=-\ChapterBackGroundHeight]current page.north west);%
    \fi%
    \ifodd\value{page}%
    \begin{minipage}[b]{.75\textwidth}
    \printcontents{}{1}[1]{}
    \end{minipage}%
    \else%
    \begin{minipage}[b]{.75\textwidth}
    \printcontents{}{1}[1]{}
    \end{minipage}%
    \fi%
	\begin{minipage}[b]{.25\textwidth}
		\filcenter
		{\scshape \color{outermarginfgcolor!50}\scalebox{2}{%
      \ifPDFTeX
      Chapter 
      \else
      章
      \fi%
    }} %\@chapapp
		\\[1.5ex]%
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		\begin{tikzpicture}[remember picture]
		\node[rectangle, %opacity=.3,text=black,
		drop shadow={opacity=.2, color=black!40!white,shadow xshift=0.1cm},
		drop shadow={opacity=.2, color=black!20!white,
		shadow xshift=-0.1cm,shadow yshift=0.1cm},
		inner sep=1.5mm,fill=outermarginfgcolor!20,
		anchor=west,
		rounded corners=1mm,
		font=\normalsize] at (0,0) {\bf \color{outermarginfgcolor}
		\scalebox{6}{\thechapter}};
		\end{tikzpicture}%
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\end{minipage}\\[1pt]%
    \ifodd\value{page}%
    \begin{tikzpicture}[remember picture]
	\shade [rectangle,left color=outermarginbgcolor!10,right color=outermarginfgcolor!40,xshift=0mm,yshift=-3\outermarginwidth] (0,0) rectangle (\textwidth,.5em);
    \end{tikzpicture}
    \else%
    \begin{tikzpicture}[remember picture]
	\shade [rectangle,left color=outermarginfgcolor!40,right color=outermarginbgcolor!10,xshift=0mm,yshift=-3\outermarginwidth] (0,0) rectangle (\textwidth,.5em);
    \end{tikzpicture}
    \fi%
    \\[-1.5ex]%
	\centering
	{
		 \chaptitlefont #1
		\medskip
	}
    }]
\titleformat{name=\chapter,numberless}
	{\startcontents\bfseries\rmfamily\filcenter}
	{}
	{0pt}
	{\chaptitlefont#1}%章标题
\titlespacing{\chapter}{0pt}{-4ex}{1.5ex}[0pt]%左、上、下、右
\makeatother
%
%%----------------------------------------------Section---------------------------------------------------%%
\titleformat{\section}
{\normalfont\LARGE\bfseries\raggedright}
{}
{.2em}
{%
\begin{tikzpicture}[remember picture,overlay]
  \ifodd\value{page}
  \node[rectangle,fill=outermarginbgcolor!10,text=outermarginfgcolor,font=\sffamily\Large,drop shadow={color=black!30!white,opacity=.3,shadow xshift=.05cm,shadow yshift=-.05cm},minimum width=\paperwidth-2\outermarginwidth,minimum height=1cm,text width=.9\linewidth,align=center] (sec) at (.5*\linewidth,0) {#1};
  \fill[font=\sffamily\Large,outermarginfgcolor,drop shadow={color=black!70,opacity=.2,shadow xshift=.08cm,shadow yshift=-.08cm}] ([yshift=-\radius,xshift=-\radius]sec.north west) arc(-180:-270:\radius) coordinate (sec number) node[right of=sec number,text=white,yshift=-\Radius,xshift=-.1*\Radius] {Sec~\thesection} -- ([xshift=1.5cm+\Radius]sec.north west)  arc(90:-90:\Radius) -- ([yshift=-2*\Radius]sec.north west)  coordinate (half arci) arc(90:180:\radius) --cycle; % 节编号 section number
  \else%
  \node[rectangle,fill=outermarginbgcolor!10,text=outermarginfgcolor,font=\sffamily\Large,drop  shadow={color=black!30!white,opacity=.3,shadow xshift=.05cm,shadow yshift=-.05cm},minimum width=\paperwidth-2\outermarginwidth,minimum height=1cm,text width=.9\linewidth,align=center] (sec) at (.5*\linewidth,0) {#1};
  \fill[font=\sffamily\Large,outermarginfgcolor,drop shadow={color=black!70,opacity=.2,shadow xshift=.08cm,shadow yshift=-.08cm}] ([yshift=-\radius,xshift=-\radius]sec.north west) arc(-180:-270:\radius) coordinate (sec number) node[right of=sec number,text=white,yshift=-\Radius,xshift=-.1*\Radius] {Sec~\thesection} -- ([xshift=1.5cm+\Radius]sec.north west)  arc(90:-90:\Radius) -- ([yshift=-2*\Radius]sec.north west)  coordinate (half arci) arc(90:180:\radius) --cycle; % 节编号 section number
  \fi
\end{tikzpicture}
\vspace*{10pt}
}
\titlespacing*{\section} {0pt}{.95ex plus 1ex minus .2ex}{1.25ex plus .2ex}
%%------------------------------------------Subsection---------------------------------------------------%%
%Underlining ruler for subsections
\titleformat{\subsection}
{\normalfont\large\bfseries\color{outermarginfgcolor}}
{\thesubsection}
{1em}
{#1}
[{\vspace*{-1em}\rule[0mm]{.5\textwidth}{1pt}}] %\rule[lift]{width}{height}
%%------------------------------------------Subsubsection---------------------------------------------------%%
%Underlining ruler for subsections
\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries\color{outermarginfgcolor}}
{\thesubsubsection}
{1em}
{#1}
[{\vspace*{-1em}\rule[0mm]{.4\textwidth}{1pt}}] %\rule[lift]{width}{height}
%%-----------------------------------------------------------%%
\titleformat{\paragraph}[runin]
{\color{outermarginfgcolor}\normalfont\normalsize\bfseries}{\theparagraph}{1em}{#1}
%%---------------------------------------------------------------%%
\titleformat{\subparagraph}[runin]
{\color{outermarginfgcolor}\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{#1}
%%===================================%%
\titlespacing*{\subsection} {0pt}{.95ex plus 1ex minus .2ex}{1.25ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{1.25ex plus 1ex minus .2ex}{1.25ex plus .2ex}
\titlespacing*{\paragraph} {0pt}{1.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph} {\parindent}{1.25ex plus 1ex minus .2ex}{1em}
%%-------------------------------------------------Part----------------------------------------------------%%
\newcommand{\partpage}{} %先建立一个变量,并赋值为空
\newcommand{\partabstract}[1]{\renewcommand{\partpage}{#1}} %再定义一个命令,重新赋值该变量,从而完成变量传递

\renewcommand\thepart{\arabic{part}}

\newcommand\partnumfont{% font specification for the number
  \lishu\fontsize{280}{120}\color{outermarginbgcolor}\selectfont%
}

\newcommand\partnamefont{% font specification for the name "PART"
  \normalfont\color{white}\sffamily\small\bfseries
}
\makeatletter
\titleformat{\part}
  {\normalfont\huge\filcenter}
  {}
  {20pt}
  {\begin{tikzpicture}[remember picture,overlay]
  \fill[outermarginbgcolor]
    ($(current page.north west)+(0,0)$) rectangle ($(current page.south east)+(0,0)$);%
  \node[
      rectangle,drop shadow={opacity=.3,color=black!40!white,shadow xshift=.05cm,shadow yshift=-.05cm},
      fill=outermarginfgcolor!90,
      text width=\paperwidth-2\outermarginwidth,
      rounded corners=5pt,
      text depth=15cm,
      anchor=center,
      inner sep=0pt] at (current page.north) (parttop)
    {\thepart};%
  \node[
      anchor=south east,
      inner sep=0pt,
      outer sep=0pt] (partnum) at ([xshift=-20pt]parttop.south)
    {\partnumfont\thepart};
  \node[
      anchor=south,
      inner sep=0pt] (partname) at ([yshift=2pt]partnum.south)
  {\partnamefont PART};
  \node[%
      anchor=north east,xshift=1.8\outermarginwidth,
      align=left,font=\Huge\sffamily\bfseries\color{outermarginfgcolor},
      inner xsep=0pt] at ([yshift=-0.5cm]partname.west|-partnum.south east)
  {\parbox[t][.5\paperheight][t]{.5\textwidth}{\raggedright#1}};%
  \node[anchor=center,xshift=-3.2\outermarginwidth,yshift=0,font=\sffamily\color{outermarginfgcolor},inner xsep=0pt,align=left,rounded corners=2pt] at ([yshift=.5\outermarginwidth]current page.east) (partright) {\ifdefvoid{\@partimage}{}{\includegraphics[width=.55\textwidth]{\@partimage}}};%
  \shade[%
      rectangle,drop shadow={opacity=.3,color=black!40!white,shadow xshift=.05cm,shadow yshift=-.05cm},
      top color=outermarginfgcolor!30,bottom color=outermarginfgcolor!20,
      rounded corners=5pt,
    ] ($(current page.south west)+(\outermarginwidth,1.2\footheight)$) rectangle ($(current page.south east)+(-\outermarginwidth,.3\paperheight+1.2\footheight)$);%
    \node[anchor=south,text=outermarginfgcolor,font=\large\sffamily\normalfont,] at ([yshift=1.25\footheight]current page.south) (partbottom) %
    {\parbox[][.3\paperheight][c]{\paperwidth-2\outermarginwidth-.5\footheight}{\partpage}};%
    \node[anchor=east] at ([xshift=.54\linewidth,yshift=.13\paperheight]partbottom){\includegraphics[width=2cm]{Beautybook/images/Pin1-removebg-preview.png}};
    \node[anchor=west] at ([xshift=-.515\linewidth,yshift=.128\paperheight]partbottom){\begin{tikzpicture}
    \shade[ball color=outermarginfgcolor] (0,0) circle [radius=5pt];
    \draw[outermarginfgcolor,line width=2pt] (0,0) circle [radius=7pt];
    \draw[outermarginfgcolor,line width=1.5pt] (0,0) circle [radius=9pt];
    \end{tikzpicture}};
    \node[anchor=south east] at ([xshift=.515\linewidth,yshift=-.17\paperheight]partbottom){\begin{tikzpicture}
    \shade[ball color=outermarginfgcolor] (0,0) circle [radius=5pt];
    \draw[outermarginfgcolor,line width=2pt] (0,0) circle [radius=7pt];
    \draw[outermarginfgcolor,line width=1.5pt] (0,0) circle [radius=9pt];
    \end{tikzpicture}};
    \node[anchor=south west] at ([xshift=-.515\linewidth,yshift=-.17\paperheight]partbottom){\begin{tikzpicture}
    \shade[ball color=outermarginfgcolor] (0,0) circle [radius=5pt];
    \draw[outermarginfgcolor,line width=2pt] (0,0) circle [radius=7pt];
    \draw[outermarginfgcolor,line width=1.5pt] (0,0) circle [radius=9pt];
    \end{tikzpicture}};
  \end{tikzpicture}%
  }
\makeatother

\makeatletter
\titleformat{name=\part,numberless}
  {\normalfont\huge\filcenter}
  {}
  {20pt}
  {\begin{tikzpicture}[remember picture,overlay]
  \fill[outermarginbgcolor]
    ($(current page.north west)+(0,0)$) rectangle ($(current page.south east)+(0,0)$);%
  \node[
      rectangle,drop shadow={opacity=.3,color=black!40!white,shadow xshift=.05cm,shadow yshift=-.05cm},
      fill=outermarginfgcolor!90,
      text width=\paperwidth-2\outermarginwidth,
      rounded corners=5pt,
      text depth=15cm,
      anchor=center,
      inner sep=0pt] at (current page.north) (parttop)
    {};%
  \node[
      anchor=south east,
      inner sep=0pt,
      outer sep=0pt] (partnum) at ([xshift=-20pt]parttop.south)
    {};
  \node[
      anchor=south,
      inner sep=0pt] (partname) at ([xshift=-55pt,yshift=2pt]partnum.south)
  {\partnamefont PART};
  \node[%
      anchor=north east,xshift=1.8\outermarginwidth,
      align=left,font=\Huge\sffamily\bfseries\color{outermarginfgcolor},
      inner xsep=0pt] at ([yshift=-0.5cm]partname.west|-partnum.south east)
  {\parbox[t][.5\paperheight][t]{.5\textwidth}{\raggedright#1}};%
  \node[anchor=center,xshift=-3.2\outermarginwidth,yshift=0,font=\sffamily\color{outermarginfgcolor},inner xsep=0pt,align=left,rounded corners=2pt] at ([yshift=.5\outermarginwidth]current page.east) (partright) {\ifdefvoid{\@partimage}{}{\includegraphics[width=.55\textwidth]{\@partimage}}};%
  \shade[%
      rectangle,drop shadow={opacity=.3,color=black!40!white,shadow xshift=.05cm,shadow yshift=-.05cm},
      top color=outermarginfgcolor!30,bottom color=outermarginfgcolor!20,
      rounded corners=5pt,
    ] ($(current page.south west)+(\outermarginwidth,1.2\footheight)$) rectangle ($(current page.south east)+(-\outermarginwidth,.3\paperheight+1.2\footheight)$);%
    \node[anchor=south,text=outermarginfgcolor,font=\large\sffamily\normalfont,] at ([yshift=1.25\footheight]current page.south) (partbottom) %
    {\parbox[][.3\paperheight][c]{\paperwidth-2\outermarginwidth-.5\footheight}{\partpage}};%
    \node[anchor=east] at ([xshift=.54\linewidth,yshift=.13\paperheight]partbottom){\includegraphics[width=2cm]{Beautybook/images/Pin1-removebg-preview.png}};
    \node[anchor=west] at ([xshift=-.515\linewidth,yshift=.128\paperheight]partbottom){\begin{tikzpicture}
    \shade[ball color=outermarginfgcolor] (0,0) circle [radius=5pt];
    \draw[outermarginfgcolor,line width=2pt] (0,0) circle [radius=7pt];
    \draw[outermarginfgcolor,line width=1.5pt] (0,0) circle [radius=9pt];
    \end{tikzpicture}};
    \node[anchor=south east] at ([xshift=.515\linewidth,yshift=-.17\paperheight]partbottom){\begin{tikzpicture}
    \shade[ball color=outermarginfgcolor] (0,0) circle [radius=5pt];
    \draw[outermarginfgcolor,line width=2pt] (0,0) circle [radius=7pt];
    \draw[outermarginfgcolor,line width=1.5pt] (0,0) circle [radius=9pt];
    \end{tikzpicture}};
    \node[anchor=south west] at ([xshift=-.515\linewidth,yshift=-.17\paperheight]partbottom){\begin{tikzpicture}
    \shade[ball color=outermarginfgcolor] (0,0) circle [radius=5pt];
    \draw[outermarginfgcolor,line width=2pt] (0,0) circle [radius=7pt];
    \draw[outermarginfgcolor,line width=1.5pt] (0,0) circle [radius=9pt];
    \end{tikzpicture}};
  \end{tikzpicture}%
  }
\makeatother
\assignpagestyle{\part}{empty} %彻底解决了part的取消边栏页面样式的问题!!!!!!!!!!!
\RequirePackage{lipsum}
\RequirePackage{epigraph}
\RequirePackage{environ}
 \RequirePackage{lettrine}
\renewcommand\LettrineFontHook{\fontfamily{rmfamily}\bfseries\color{outermarginfgcolor}}
%%-----------------------------------------------%%
%%%%%章节标题样式结束%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% III. Adjusting the header and footer %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Change the header and footer of pages where chapters do not start (depends on twoside option)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% IV. Creating the cover page %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%===============================================================%%%%%
%%------------------------------------------------------封面设计--------------------------------------------------------%%
%%%%===============================================================%%%%%

\colorlet{coverbgcolor}{teal!30}
\colorlet{coverfgcolor}{teal}
\newlength\CoverLogoyshift
\newlength\TitleWidth
\makeatletter
\newcommand*\makecover{
    %% Use the Tikz library positioning and clear the page header and footer
    \usetikzlibrary{positioning}
    \thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
  \fill[coverbgcolor]
    (current page.north west) rectangle (current page.south east);% 背景颜色
  %\fill[coverfgcolor]
    %($(current page.north west)+(0,0)$) rectangle ($(current page.south west)+(.96\TitleWidth,0)$);% 最左侧页边条
	\fill [coverfgcolor!20]%
	($(current page.north west)+(0,0)$) rectangle ($(current page.south west)+(.96\TitleWidth,0)$);
    \pattern [pattern=checkerboard,pattern color=coverfgcolor!50]%
	($(current page.north west)+(0,0)$) rectangle ($(current page.south west)+(.96\TitleWidth,0)$);
    \fill [coverbgcolor!90,path fading=fade south]%
    ($([yshift=1mm]current page.north west)+(0,0)$) rectangle ($(current page.south west)+(.96\TitleWidth,0)$);
	\fill [coverbgcolor,path fading=fade north]%
	($(current page.north west)+(0,0)$) rectangle ($(current page.south west)+(.96\TitleWidth,0)$);
  \shade[drop shadow={opacity=.3,color=black!40!white,shadow xshift=-.05cm,shadow yshift=-.05cm},top color=coverfgcolor!50, bottom color=coverbgcolor!20,rounded corners=5pt]%
        ($(current page.north west)+(\TitleWidth,0)$) rectangle ($(current page.north east)+(-\TitleWidth,-10cm)$) ; %顶部标题大矩形
		\fill [coverfgcolor!20,rounded corners=5pt]%
		($(current page.north west)+(\TitleWidth,0)$) rectangle ($(current page.north east)+(-\TitleWidth,-10cm)$) ;
		\pattern [pattern=checkerboard,pattern color=coverfgcolor!50,rounded corners=5pt]%
		($(current page.north west)+(\TitleWidth,0)$) rectangle ($(current page.north east)+(-\TitleWidth,-10cm)$) ;
		\fill [coverbgcolor!90,path fading=fade south,rounded corners=5pt]%
		($([yshift=1mm]current page.north west)+(\TitleWidth,0)$) rectangle ($(current page.north east)+(-\TitleWidth,-10cm)$) ;
		\fill [coverbgcolor,path fading=fade north,rounded corners=5pt]%
		($(current page.north west)+(\TitleWidth,0)$) rectangle ($(current page.north east)+(-\TitleWidth,-10cm)$) ;
  \shade[rectangle,left color=coverfgcolor!30,right color=coverfgcolor!20,rounded corners=5pt,drop shadow={opacity=.3,color=black!40!white,shadow xshift=-.05cm,shadow yshift=-.05cm}]%
        ($([yshift=-16cm]current page.north west)+(\TitleWidth,0)$) rectangle ($([yshift=-16cm]current page.north east)+(0,\TitleWidth)$) ; %中间分隔色带
  \shade[rectangle,left color=coverbgcolor!90,right color=coverbgcolor!50] ($([yshift=-5.5cm]current page.north east)+(-.96\TitleWidth,0)$) rectangle ($([yshift=-5.5cm]current page.north east)+(0,\TitleWidth)$); %最右侧装饰矩形1
  \shade[rectangle,left color=coverbgcolor!90,right color=coverbgcolor!50] ($([yshift=-7.5cm]current page.north east)+(-.96\TitleWidth,0)$) rectangle ($([yshift=-7.5cm]current page.north east)+(0,1/2*\TitleWidth)$); % %最右侧装饰矩形2
  \shade[rectangle,left color=coverbgcolor!90,right color=coverbgcolor!50] ($([yshift=-9.5cm]current page.north east)+(-.96\TitleWidth,0)$) rectangle ($([yshift=-9.5cm]current page.north east)+(0,1/3*\TitleWidth)$); %%最右侧装饰矩形3
  \shade[rectangle,left color=coverbgcolor!90,right color=coverbgcolor!50] ($([yshift=-10cm-.4\TitleWidth]current page.north east)+(-8.5\TitleWidth,0)$) rectangle ($([yshift=-10cm-.4\TitleWidth]current page.north east)+(0,-1.4\TitleWidth)$); % 封面版本与名言信息栏底色
  \shade[rectangle,left color=coverbgcolor!90,right color=coverbgcolor!50] ($([yshift=-15cm-.8\TitleWidth]current page.north east)+(-4\TitleWidth,0)$) rectangle ($([yshift=-15cm-.8\TitleWidth]current page.north east)+(0,-\TitleWidth)$); % 封面作者信息栏底色
  %%
  \node[ anchor=south] at ([yshift=-7cm]current page.north)
    {%
    \parbox{7\TitleWidth}{%
            \filcenter%
            \color{coverfgcolor}\rmfamily\bfseries\fontsize{30}{30}\selectfont\@title \\[0.5ex]
            \color{coverfgcolor}\normalfont\fontsize{20}{20}\selectfont%
            \ifdefvoid{\@subtitle}{}{\lishu\@subtitle \\[1ex]}%
        }};% 封面标题与副标题
\node[anchor=south east,
	inner sep=0pt,
	outer sep=0pt]  at ([xshift=-\TitleWidth,yshift=-10cm-1.65\TitleWidth]current page.north east)
    {%
        \parbox{7\TitleWidth}{%
            \filleft
            {\color{coverfgcolor}\sffamily\normalfont\Large\bfseries\@version} \\[0.5ex]
            \color{coverfgcolor}\kaiti\@motto }% 版本号与名言警句
    };
  \node[anchor=south east,
      inner sep=0pt,
      outer sep=0pt]  at ([xshift=-\TitleWidth,yshift=-15.5cm-1.3\TitleWidth]current page.north east)
    {%
        \parbox{2\TitleWidth}{%
          \filleft
          \color{coverfgcolor}\sffamily\normalfont\bfseries\@editor \\[0.5ex]
          \color{coverfgcolor}\sffamily\normalfont\bfseries\@author }% 封面主编与作者信息栏
    };
	\node[%
		anchor=south west,xshift=\TitleWidth,%drop shadow={opacity=.3,color=black!10!white,shadow xshift=.05cm,shadow yshift=-.05cm},rounded corners=5pt,
		align=left,inner xsep=0pt] at ([yshift=1.65\TitleWidth]current page.south west)
	{\includegraphics[width=.65\linewidth,]{\@coverimage}};% 封面图片1
	\node[%
		anchor=south east,xshift=-.4\TitleWidth,%drop shadow={opacity=.3,color=black!10!white,shadow xshift=.05cm,shadow yshift=-.05cm},rounded corners=5pt,
		align=left,inner xsep=0pt] at ([yshift=1.68\TitleWidth]current page.south east)
	{\includegraphics[width=.45\linewidth,]{\@covertikz}};% 封面图片2
  \node[anchor=south,text=coverfgcolor] at ([xshift=-4.8\TitleWidth,yshift=2.6\footheight]current page.south east)  %
{\sffamily\bfseries\normalfont\@coverequation}; %封面公式
   \node[anchor=south,text=coverfgcolor,font=\large\lishu,] at ([yshift=0\footheight]current page.south)  %
    {\raisebox{-\CoverLogoyshift}{\includegraphics[width=0.2\linewidth]{\@coverlogo}}\hspace*{-.4ex}\parbox[c][\TitleWidth][c]{.4\textwidth}{\@press}};% 出版社logo与出版社名称
    %\parbox[<baseline position>][<height>][<alignment>]{<width>}{<content>}
    %与水平盒子的对齐方式类似, <alignment>也有四个可选值, 分别是: c(center),t(top),b(bottom),s(scatter), 注意其中的 t选项是指对齐第一行的基线, 而不是盒子的顶端, s选项仅在设置了弹性间距时有效.
    %<baseline position>有三个可选项,分别是c(center),t(top),b(bottom).
    %\raisebox{<distance>}[<height>][<depth>]{<content>} 升降盒子
\end{tikzpicture}%
  \newpage
}
\makeatother
%%%%===============================================================%%%%%
%%------------------------------------------------------封面设计--------------------------------------------------------%%
%%%%===============================================================%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% V. Setting up listings %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{listings} % Typeset source code listings
\lstset{
    basicstyle=\ttfamily\footnotesize,  % Style of the font that is used for the code
    backgroundcolor=\color{gray!10},    % Background color
    keywordstyle=\color{red!75!black},  % Keyword style
    stringstyle=\color{green!40!black}, % String style
    commentstyle=\color{blue!30!black}, % Comment style
    numbers=left,                       % Add line numbers on the left side
    numbersep=5pt,                      % Decrease distance between line numbers and code
    numberstyle=\tiny,                  % Line number style
    breaklines=true,                    % Line break automatically
}
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%定理设置部分%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%\ifPDFTeX

\ifPDFTeX %名词翻译
%%定理计数器设置
\newcounter{tcbthm}
\renewcommand{\thetcbthm}{\thesection.\arabic{tcbthm}}
\def\tcbthmautorefname{\bf Theorem}
%
\newcounter{tcblemma}
\renewcommand{\thetcblemma}{\thesection.\arabic{tcblemma}}
\def\tcblemmaautorefname{\bf Lemma}
%
\newcounter{tcbproposition}
\renewcommand{\thetcbproposition}{\thesection.\arabic{tcbproposition}}
\def\tcbpropositionautorefname{\bf Proposition}
%
\newcounter{tcbcorollary}
\renewcommand{\thetcbcorollary}{\thesection.\arabic{tcbcorollary}}
\def\tcbcorollaryautorefname{\bf Corollary}
%
\newcounter{tcbaxiom}
\renewcommand{\thetcbaxiom}{\thesection.\arabic{tcbaxiom}}
\def\tcbaxiomautorefname{\bf Axiom}
%
\newcounter{tcbdefinition}
\renewcommand{\thetcbdefinition}{\thesection.\arabic{tcbdefinition}}
\def\tcbdefinitionautorefname{\bf Definition}
%
\newcounter{tcbproperty}
\renewcommand{\thetcbproperty}{\thesection.\arabic{tcbproperty}}
\def\tcbpropertyautorefname{\bf Property}
%
\newcounter{tcbexam}
\renewcommand{\thetcbexam}{\thesection.\arabic{tcbexam}}
\def\tcbexamautorefname{\bf Example}
%问题环境
\newcounter{tcbproblem}
\renewcommand{\thetcbproblem}{\thesection.\arabic{tcbproblem}}
\def\tcbproblemautorefname{\bf Problem}
%注解环境
% \newcounter{tcbremark}
% \renewcommand{\thetcbremark}{\thesection.\arabic{tcbremark}}
% \def\tcbremarkautorefname{\bf 注解}
%%定理计数器设置
%%定理环境标题盒子设置
%翻译
\newcommand{\Example}{Example}
\newcommand{\Proofs}{$\twemoji{open book}$~Proof}
\newcommand{\Solutions}{$\twemoji{books}$~Solution}
\newcommand{\Exercisename}{$\twemoji{pen}$~Exercise}
\newcommand{\Summaryname}{Summary}
\newcommand{\Remark}{$\twemoji{270f}$~Remark}
\newcommand{\Problem}{Problem}
\newcommand{\Property}{Property}
\newcommand{\Definition}{Definition}
\newcommand{\Axiom}{Axiom}
\newcommand{\Lemma}{Lemma}
\newcommand{\Proposition}{Proposition}
\newcommand{\Theorem}{Theorem}
\newcommand{\Corollary}{Corollary}


%%-----------------------------------------------------------------------------------------------------------------%%
\else%%--------------------------------------XeLaTeX Or LuaLaTeX------------------------------------------%%
%%定理计数器设置
\newcounter{tcbthm}
\renewcommand{\thetcbthm}{\thesection.\arabic{tcbthm}}
\def\tcbthmautorefname{\bf 定理}
%
\newcounter{tcblemma}
\renewcommand{\thetcblemma}{\thesection.\arabic{tcblemma}}
\def\tcblemmaautorefname{\bf 引理}
%
\newcounter{tcbproposition}
\renewcommand{\thetcbproposition}{\thesection.\arabic{tcbproposition}}
\def\tcbpropositionautorefname{\bf 命题}
%
\newcounter{tcbcorollary}
\renewcommand{\thetcbcorollary}{\thesection.\arabic{tcbcorollary}}
\def\tcbcorollaryautorefname{\bf 推论}
%
\newcounter{tcbaxiom}
\renewcommand{\thetcbaxiom}{\thesection.\arabic{tcbaxiom}}
\def\tcbaxiomautorefname{\bf 公理}
%
\newcounter{tcbdefinition}
\renewcommand{\thetcbdefinition}{\thesection.\arabic{tcbdefinition}}
\def\tcbdefinitionautorefname{\bf 定义}
%
\newcounter{tcbproperty}
\renewcommand{\thetcbproperty}{\thesection.\arabic{tcbproperty}}
\def\tcbpropertyautorefname{\bf 性质}
%
\newcounter{tcbexam}
\renewcommand{\thetcbexam}{\thesection.\arabic{tcbexam}}
\def\tcbexamautorefname{\bf 例题}
%问题环境
\newcounter{tcbproblem}
\renewcommand{\thetcbproblem}{\thesection.\arabic{tcbproblem}}
\def\tcbproblemautorefname{\bf 问题}
%练习
\newcounter{tcbexercise}
\renewcommand{\thetcbexercise}{\thesection.\arabic{tcbexercise}}
\def\tcbexerciseautorefname{\bf 练习}
%注解环境
% \newcounter{tcbremark}
% \renewcommand{\thetcbremark}{\thesection.\arabic{tcbremark}}
% \def\tcbremarkautorefname{\bf 注解}
%翻译
\newcommand{\Example}{例题}
\newcommand{\Proofs}{$\twemoji{open book}$~证明}
\newcommand{\Solutions}{$\twemoji{books}$~解}
\newcommand{\Exercisename}{$\twemoji{pen}$~练习}
\newcommand{\Summaryname}{总结}
\newcommand{\Remark}{$\twemoji{270f}$~注}
\newcommand{\Problem}{问题}
\newcommand{\Property}{性质}
\newcommand{\Definition}{定义}
\newcommand{\Axiom}{公理}
\newcommand{\Lemma}{引理}
\newcommand{\Proposition}{命题}
\newcommand{\Theorem}{定理}
\newcommand{\Corollary}{推论}
\fi
%%-----------------------------------------------------------------------------------------------------------------%%
\newlength{\examlen}
\tikzset{
	wnodeTheorem/.style={%
		rectangle,top color=lightergray, bottom color=lightergray,
		inner sep=1mm,anchor=west,font=\bf\rmfamily},
	% wnodeminimum/.style={%
	% 	rectangle,  top color=white, bottom color=white,
	% 	text=Emerald,inner sep=1mm,anchor=west,font=\bf\rmfamily}
}
%%定理环境标题盒子设置
%---------------------------------------------------------------%
% ----------------定理开始 -----------------------------------------------------
%\begin{theorem}  or \begin{theorem}[detail] or \begin{theorem}[][ref]
	\newtcolorbox{wwtheorem}[3][]{
		arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
		fontupper=\itshape, step and label={tcbthm}{#3},
		overlay unbroken = {
			%标题%更改有效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=purple5,
	anchor=west,inner xsep=7mm,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf   \Theorem\ \thetcbthm.~#2};
            \fill[color=purple5,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
      \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
      \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[purple5,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			%标题 %跨页时生效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=purple5,
	anchor=west,inner xsep=7mm,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf  \Theorem\ \thetcbthm.~#2};
            \fill[color=purple5,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%%============================%% End
            \fill[purple5,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{theorem}{O{} O{} O{}}{\smallskip\begin{wwtheorem}{#1}{#2}#3}{\end{wwtheorem} \smallskip}
% 定理结束 ---------------------------------------------------------

%引理-------------------------------------------------------------
\newtcolorbox{wwlemma}[3][]{
		arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
		fontupper=\normalsize, step and label={tcblemma}{#3},
		overlay unbroken = {
			%左上边缘细线%更改有效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%标题%更改有效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=DarkOrchid,
	anchor=west,inner xsep=7mm,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\Lemma\ \thetcblemma.~#2};
            \fill[color=DarkOrchid,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[DarkOrchid,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			%标题 %跨页时生效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=DarkOrchid,
	anchor=west,inner xsep=7mm,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\Lemma\ \thetcblemma.~#2};
            \fill[color=DarkOrchid,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%%============================%% End
            \fill[DarkOrchid,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{lemma}{O{} O{} O{}}{\smallskip\begin{wwlemma}{#1}{#2}#3}{\end{wwlemma} \smallskip}
%引理结束----------------------------------------------------------

%命题-------------------------------------------------------------
\newtcolorbox{wwproposition}[3][]{
		arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
		fontupper=\normalsize, step and label={tcbproposition}{#3},
		overlay unbroken = {
			%左上边缘细线%更改有效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%标题%更改有效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=DeepPink,
	anchor=west,inner xsep=7mm,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\Proposition\ \thetcbproposition.~#2};
            \fill[color=DeepPink,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[DeepPink,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			%标题 %跨页时生效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=DeepPink,
	anchor=west,inner xsep=7mm,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\Proposition\ \thetcbproposition.~#2};
            \fill[color=DeepPink,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%%============================%% End
            \fill[DeepPink,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{proposition}{O{} O{} O{}}{\smallskip\begin{wwproposition}{#1}{#2}#3}{\end{wwproposition}\smallskip }
%命题结束----------------------------------------------------------

%推论-------------------------------------------------------------
\newtcolorbox{wwcorollary}[3][]{
		arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
		fontupper=\normalsize, step and label={tcbcorollary}{#3},
		overlay unbroken = {
			%左上边缘细线%更改有效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%标题%更改有效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=BlueGreen,
	anchor=west,inner xsep=7mm,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\Corollary\ \thetcbcorollary.~#2};
            \fill[color=BlueGreen,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[BlueGreen,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			%标题 %跨页时生效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=BlueGreen,
	anchor=west,inner xsep=7mm,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\Corollary\ \thetcbcorollary.~#2};
            \fill[color=BlueGreen,drop shadow={opacity=0.3,shadow xshift=.3pt}] ([yshift=5pt,xshift=-5pt]frame.north west) -- ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=-5pt,yshift=-1cm]frame.north west)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%%============================%% End
            \fill[BlueGreen,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] ([xshift=5pt,yshift=-5pt]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=5pt,yshift=0.05\linewidth]frame.south east)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{corollary}{O{} O{} O{}}{\smallskip\begin{wwcorollary}{#1}{#2}#3}{\end{wwcorollary}\smallskip }
%推论结束----------------------------------------------------------

%公理-------------------------------------------------------------
\newtcolorbox{wwaxiom}[3][]{
		arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
		fontupper=\normalsize, step and label={tcbaxiom}{#3},
		overlay unbroken = {
			%左上边缘细线%更改有效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%标题%更改有效
			\node[rectangle, %opacity=.3,
	text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=RedViolet,
	anchor=west,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf  \color{white} \Axiom\thetcbaxiom.~#2};
			%底部 (下边缘)颜色装饰矩形%更改有效
			\fill[fill=RedViolet]  (.95\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			%标题 %跨页时生效
			\node[rectangle, %opacity=.3,
	text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=RedViolet,
	anchor=west,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf  \color{white} \Axiom\thetcbaxiom.~#2};
		},%保持边缘的变化
		overlay last = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
			%底部%跨页时生效
			\fill[fill=RedViolet]  (.95\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
		}
		#1
	}
\NewDocumentEnvironment{axiom}{O{} O{} O{}}{\smallskip\begin{wwaxiom}{#1}{#2}#3}{\end{wwaxiom} }
%公理结束----------------------------------------------------------


% 定义开始---------------------------------------------------------
\newtcolorbox{wwdefinition}[3][]{%
arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,drop fuzzy shadow=black!20!white,top=8mm, %分隔垂直-开始文本
%enlarge top by=\baselineskip/2+1mm,
%enlarge top at break by=0mm,pad at break=2mm,
fontupper=\normalsize,step and label={tcbdefinition}{#3},
overlay unbroken  = {
	%垂直线段%更改有效
	\draw[color=azure5,  line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	%定义标题 %更改有效
	% \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
	% {\textbf{\color{deepBlue} 定义 \thetcbdefinition.~#2}};
	\node[rectangle, %opacity=.3,
	text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=azure5,
	anchor=west,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf  \color{white}\Definition \thetcbdefinition.~#2};
}, %overlay%下面的代码仅在跨页分割时生效
overlay first  = {
	%垂直线段%跨页时生效
	\draw[color=azure5,  line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	%定义标题 %跨页时生效
	% \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
	% {\textbf{\color{deepBlue} 定义 \thetcbdefinition.~#2}};
	\node[rectangle, %opacity=.3,
	text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=azure5,
	anchor=west,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf  \color{white}\Definition \thetcbdefinition.~#2};
}, %overlay
% 保持边缘而不是
overlay last    = {
	%垂直线段%跨页时生效
	\draw[color=deepBlue,  line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
}
#1
}
\NewDocumentEnvironment{definition}{O{} O{} O{}}{\smallskip\begin{wwdefinition}{#1}{#2} #3}{\end{wwdefinition} }
% 定义结束---------------------------------------------------------

%性质-------------------------------------------------------------
\newtcolorbox{wwproperty}[3][]{%
arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,drop fuzzy shadow=black!20!white,top=8mm, %分隔垂直-开始文本
%enlarge top by=\baselineskip/2+1mm,
%enlarge top at break by=0mm,pad at break=2mm,
fontupper=\normalsize,step and label={tcbproperty}{#3},
overlay unbroken  = {
	%垂直线段%更改有效
	\draw[color=Salmon,  line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	%定义标题 %更改有效
	% \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
	% {\textbf{\color{deepBlue} 性质 \thetcbproperty.~#2}};
	\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=Salmon,
	anchor=west,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf   \Property \thetcbproperty.~#2};
}, %overlay
overlay first  = {
	%垂直线段%跨页时生效
	\draw[color=Salmon,  line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	%定义标题 %跨页时生效
	% \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
	% {\textbf{\color{deepBlue} 性质 \thetcbproperty.~#2}};
	\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=Salmon,
	anchor=west,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\bf  \Property \thetcbproperty.~#2};
}, %overlay
% 保持边缘而不是
overlay last    = {
	%垂直线段%跨页时生效
	\draw[color=Salmon,  line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
}
#1
}
\NewDocumentEnvironment{property}{O{} O{} O{}}{\smallskip\begin{wwproperty}{#1}{#2} #3}{\end{wwproperty} }
%性质结束----------------------------------------------------------

% 例题开始 --------------------------------------------------
% 例题环境
\definecolor{lightyellow}{RGB}{255,254,250}
\newlength\radius % 小圆弧半径
\setlength{\radius}{.3cm}
\newlength\Radius % 大圆弧半径
\setlength{\Radius}{.4cm}
\newlength\shadowshift % 等腰三角形阴影的腰线长度
\setlength\shadowshift{3pt}
% 例题环境
\definecolor{lightyellow}{RGB}{255,254,250}
\newtcolorbox{wwexample}[3][]{%
arc=0mm,
breakable,drop fuzzy shadow=black!20!white,
enhanced,
colback=lightyellow,
boxrule=0pt,
top=9mm, %分隔垂直-开始文本
% enlarge top by=\baselineskip/2+1mm,
% enlarge top at break by=0mm,pad at break=2mm,
fontupper=\normalsize,
step and label={tcbexam}{#3},%标签
overlay unbroken = {
%左上角
\fill[font=\sffamily,Emerald,drop shadow={color=black!70,opacity=.2,shadow xshift=.08cm,shadow yshift=-.08cm}] ([yshift=-\radius,xshift=-\radius]frame.north west) arc(-180:-270:\radius) coordinate (exam number) node[right of=exam number,text=white,yshift=-\Radius,xshift=1.5*\Radius] {\bf\Example \thetcbexam.~#2} -- ([xshift=6.5cm]frame.north west)  arc(90:-90:\Radius) -- ([yshift=-2*\Radius]frame.north west)  coordinate (half arc) arc(90:180:\radius) --cycle; % 节编号 section number
\fill[teal] (half arc) arc(90:270:\radius)--cycle;
%右下角
\fill[black!50] ([xshift=-0.05\linewidth,yshift=-\shadowshift]frame.south east) -- ([xshift=-0.05\linewidth]frame.south east)-- ([xshift=-0.04\linewidth]frame.south east)--cycle;
\fill[black!50] ([xshift=\shadowshift,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.05\linewidth]frame.south east) -- ([yshift=0.04\linewidth]frame.south east)--cycle;
\fill[Emerald,drop shadow={black!50,opacity=.3,shadow xshift=0.05cm,shadow yshift=-0.05cm}] ([xshift=\shadowshift,yshift=-\shadowshift]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-\shadowshift]frame.south east) -- ([xshift=\shadowshift,yshift=0.05\linewidth]frame.south east)--cycle;
},
% fin overlay
overlay first  = {
%左上角
\fill[font=\sffamily,Emerald,drop shadow={color=black!70,opacity=.2,shadow xshift=.08cm,shadow yshift=-.08cm}] ([yshift=-\radius,xshift=-\radius]frame.north west) arc(-180:-270:\radius) coordinate (exam number) node[right of=exam number,text=white,yshift=-\Radius,xshift=5*\Radius] {\bf\Example \thetcbexam.~#2} -- ([xshift=6.5cm]frame.north west)  arc(90:-90:\Radius) -- ([yshift=-2*\Radius]frame.north west)  coordinate (half arc) arc(90:180:\radius) --cycle; % 节编号 section number
\fill[teal] (half arc) arc(90:270:\radius)--cycle;
},
% overlay
%边缘改变%跨页时生效
overlay middle={\draw[color=Emerald!80,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
},
overlay last={
%右下角
\fill[black!50] ([xshift=-0.05\linewidth,yshift=-\shadowshift]frame.south east) -- ([xshift=-0.05\linewidth]frame.south east)-- ([xshift=-0.04\linewidth]frame.south east)--cycle;
\fill[black!50] ([xshift=\shadowshift,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.05\linewidth]frame.south east) -- ([yshift=0.04\linewidth]frame.south east)--cycle;
\fill[Emerald,drop shadow={black!50,opacity=.3,shadow xshift=0.05cm,shadow yshift=-0.05cm}] ([xshift=\shadowshift,yshift=-\shadowshift]frame.south east) -- ([xshift=-0.05\linewidth,yshift=-\shadowshift]frame.south east) -- ([xshift=\shadowshift,yshift=0.05\linewidth]frame.south east)--cycle;
}
#1}
%
\NewDocumentEnvironment{example}{O{} O{} O{}}{\smallskip\begin{wwexample}{#1}{#2}%
	#3}{\end{wwexample} }
%例题结束-----------------------------------------------------------------

%问题------------------------------------------------------------
\newtcolorbox{wwproblem}[3][]{%
arc=0mm,
breakable,drop fuzzy shadow=black!20!white,
enhanced,
colback=lightyellow,
boxrule=0pt,
top=8mm, %分隔垂直-开始文本
% enlarge top by=\baselineskip/2+1mm,
% enlarge top at break by=0mm,pad at break=2mm,
fontupper=\normalsize,
step and label={tcbproblem}{#3},%标签
overlay unbroken = {%
	%底部装饰矩形%更改有效
	\fill[fill=teal] (.95\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    %垂直线段%更改有效
	\draw[color=gray!80,line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	%框编号和描述%更改有效
	\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=teal,
	anchor=west,
	font=\normalsize] (titlebox) at ([xshift=-8pt,yshift=-3.mm]frame.north west)%
	{\bf  \Problem \thetcbproblem.~#2}; %标题
    \fill[teal] (titlebox.south west) --([yshift=.5pt]titlebox.south west)-- ([xshift=11pt,yshift=.5pt]titlebox.south west) -- ([xshift=11pt,yshift=-11pt]titlebox.south west)--cycle;
},
% fin overlay
overlay first  = {%
	%标题框编号和描述 %跨页时生效
	\draw[color=gray!80,line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	%框编号和描述 %跨页时生效
	\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=teal,
	anchor=west,
	font=\normalsize] (titlebox) at ([xshift=-8pt,yshift=-3.mm]frame.north west)%
	{\bf  \Problem \thetcbproblem.~#2}; %标题
    \fill[teal] (titlebox.south west) --([yshift=.5pt]titlebox.south west)-- ([xshift=11pt,yshift=.5pt]titlebox.south west) -- ([xshift=11pt,yshift=-11pt]titlebox.south west)--cycle;
},
% overlay
%边缘改变%跨页时生效
overlay middle={\draw[color=gray!80,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
},
overlay last={\draw[color=gray!80,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
	%底部装饰矩形%跨页时生效
	\fill[fill=teal] (.95\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
 }
#1}
%
\NewDocumentEnvironment{problem}{O{} O{} O{}}{\smallskip\begin{wwproblem}{#1}{#2}%
	#3}{\end{wwproblem} }
%问题结束----------------------------------------------------------

%注解环境-------------------------------------------------------
\newtcolorbox{remarkbox}[2][]{%
	arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
	top=6mm,fontupper=\normalsize\itshape,%step and label={tcbremark}{#3},
	overlay unbroken  = {
		%垂直条%更改有效
		\draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
		%标题：定义%更改有效
		\node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
		{\textbf{\color{magenta5} \Remark ~#2}};
		% \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
	}, %overlay
	overlay first  = {
		%垂直线段%跨页时生效
		\draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
		%标题:定义 %跨页时生效
		\node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
		{\textbf{\color{magenta5} \Remark ~#2}};
		% \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
	}, %overlay
	% 保持边缘的变化
	overlay last    = {
		%垂直线段%跨页时生效
		\draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
	}
	#1
}
%
\NewDocumentEnvironment{remark}{O{} O{} O{}}{\smallskip\begin{remarkbox}{#1}{#2} #3}{\end{remarkbox}}
% 结束注解

%%-------------------------------------------------------------------------------------------------------------------------------%%
%练习题标题
\newcommand{\ExerciseTitle}[2][Magenta]%栏目标题
{
\begin{center}
\begin{tikzpicture}
\path[fill=#1!20](0,0)--(.7em,.8em)--(22em,.8em)--(22.7em,0)--(22em,-.8em)--(.7em,-.8em)--(0,0);
\path[fill=#1!40](2em,0)--(2.7em,.8em)--(20em,.8em)--(20.7em,0)--(20em,-.8em)--(2.7em,-.8em)--(2em,0);
\path[fill=#1!60](4em,0)--(4.7em,.8em)--(18em,.8em)--(18.7em,0)--(18em,-.8em)--(4.7em,-.8em)--(4em,0);
\path[fill=#1!80](6em,0)--(6.7em,.8em)--(16em,.8em)--(16.7em,0)--(16em,-.8em)--(6.7em,-.8em)--(6em,0);
\node[white] at (11em,0) {{\bf \Large #2}};
\end{tikzpicture}
\end{center}
}
%
%
\newcommand{\Exercise}{%
\ExerciseTitle[outermarginfgcolor]{\bf \Exercisename  \thesection}
}
\newcommand{\Summary}%总结
{
\ExerciseTitle[outermarginfgcolor]{\bf \Summaryname  \thesection}
}
%%--------------------------------------------------------------------------------------------------------------%%
\declaretheoremstyle[
    spaceabove=3pt,spacebelow=3pt,
    headfont=\normalfont\bfseries,
    notefont=\normalfont\bfseries,notebraces={(}{)},
    bodyfont=\normalfont,
    postheadspace=1em,
    headpunct={.},
    qed=\qedsymbol
]{Proofstyle}
\declaretheorem[style=Proofstyle,numbered=no,name={\bf \Proofs}]{Proof}
\renewenvironment{proof}{\begin{Proof} }{\end{Proof}}
\declaretheorem[style=Proofstyle,numbered=no,name={\bf \Solutions}]{solution}
%%----------------------------------------------------------------------------------------------------------------%%
\newmdenv[topline=false,bottomline=false,rightline=false,leftline=true,linewidth=2pt,
leftmargin=5pt,rightmargin=5pt,linecolor=magenta5,backgroundcolor=brown9!8,
shadow=true,shadowsize=2pt,shadowcolor=gray9!50,
]{mybox1}
%%--------------------------------------------------------------------------------------------------------------%%
\newcounter{Exam}[chapter]\renewcommand{\theExam}{\thechapter.\arabic{Exam}}
\newcommand{\Ex}{\par{\bf \Example~}\refstepcounter{Exam}{\bf\theExam}\hspace{1em}}%例XXX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%------------------------------------------------------------------------------------------------------------------------%%
% Define An Environment For The Introducetion Of A Chapter
\tcbset{
introductionsty/.style={
    enhanced,
    breakable,
    colback=azure9!10,
    colframe=outermarginfgcolor,
    boxrule=0pt,toprule=2pt,
    top=8pt,
    before skip=12pt,
    sharp corners,
    arc=0mm,
    drop fuzzy shadow={color=black!20!white,opacity=.3,shadow xshift=0.1cm},%盒子阴影
	overlay = {%
	%标题盒子
	\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
	inner sep=1.5mm,fill=outermarginfgcolor,
	anchor=west,
	font=\bfseries] at ([xshift=.4\textwidth,yshift=.5mm]frame.north west)%
	{\bf \introductionname};
	},
}
}
%%-----------------------------------------------------------------------------------------------------------------------%%
\newenvironment{introduction}{\smallskip
	\begin{tcolorbox}[introductionsty]
		\begin{multicols}{2}
		\begin{itemize}[label=\textcolor{outermarginfgcolor}{\upshape\SquareShadowBottomRight}]}{
		\end{itemize}
		\end{multicols}
	\end{tcolorbox}\smallskip}
%%------------------------------------------------------------------------------------------------------------------------%%
%% Begin The Most Beautiful Box (STYLE : ys style)

% \usepackage{tikz}
\usetikzlibrary{arrows.meta, calc, fadings, decorations.markings}
\RequirePackage{pgfornament}

\makeatletter
\definecolor{framegolden}{HTML}{CC2F69} % 控制外框颜色
% \colorlet{framegolden}{outermarginfgcolor}
\definecolor{framegray}{HTML}{e2dbbe} % 控制填充颜色
\newdimen\ys@frame@linewidth
\newdimen\ys@frame@radius
\newdimen\ys@frame@sep

\pgfdeclarehorizontalshading{ys@fade@circle}{500bp}
{color(0bp)=(pgftransparent!100); color(25bp)=(pgftransparent!100);
color(45bp)=(pgftransparent!0); color(55bp)=(pgftransparent!0);
color(75bp)=(pgftransparent!100); color(100bp)=(pgftransparent!100)}
\pgfdeclarefading{ys circle}{\pgfuseshading{ys@fade@circle}}

\def\ys@frame@star@list@t{%
  -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    frame.north east,%
  0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    frame.north west}
\def\ys@frame@star@list@b{%
  0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    frame.south west,%
  -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    frame.south east}
\edef\ys@frame@star@list{\ys@frame@star@list@t,\ys@frame@star@list@b}

%region outer
\def\ys@frame@unbrokenouter{%
  \path[draw=framegolden,fill=framegray!50,fill opacity=.2,line width=\ys@frame@linewidth]
    ([xshift=\ys@frame@radius]frame.north west)--([xshift=-\ys@frame@radius]frame.north east) 
    arc(-180:-90:\ys@frame@radius)--
    ([yshift=-\ys@frame@radius]frame.north east)--([yshift=\ys@frame@radius]frame.south east)
    arc(90:180:\ys@frame@radius)--
    ([xshift=-\ys@frame@radius]frame.south east)--([xshift=\ys@frame@radius]frame.south west)
    arc(0:90:\ys@frame@radius)--
    ([yshift=\ys@frame@radius]frame.south west)--([yshift=-\ys@frame@radius]frame.north west)
    arc(-90:0:\ys@frame@radius)--cycle;}
\def\ys@frame@firstouter{%
  \path[draw=framegolden,fill=framegray!50,fill opacity=.2,line width=\ys@frame@linewidth]
    ([xshift=\ys@frame@radius]frame.north west)--([xshift=-\ys@frame@radius]frame.north east) 
    arc(-180:-90:\ys@frame@radius)--
    ([yshift=-\ys@frame@radius]frame.north east)--
    (frame.south east)--
    (frame.south west)--
    ([yshift=-\ys@frame@radius]frame.north west)
    arc(-90:0:\ys@frame@radius)--cycle;}
\def\ys@frame@middleouter{%
  \path[draw=framegolden,fill=framegray!50,fill opacity=.2,line width=\ys@frame@linewidth]
    (frame.north west)--(frame.north east)--(frame.south east)--
    (frame.south west)--cycle;}
\def\ys@frame@lastouter{%
  \path[draw=framegolden,fill=framegray!50,fill opacity=.2,line width=\ys@frame@linewidth]
    (frame.north west)--(frame.north east)--
    ([yshift=\ys@frame@radius]frame.south east)
    arc(90:180:\ys@frame@radius)--
    ([xshift=-\ys@frame@radius]frame.south east)--([xshift=\ys@frame@radius]frame.south west)
    arc(0:90:\ys@frame@radius)--
    ([yshift=\ys@frame@radius]frame.south west)--
    (frame.north west)--cycle;}
%endregion 
%region inner
\def\ys@frame@unbrokeninner{%
\path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
  --([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west) --++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
  ([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第一节
  --([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
  ([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
  --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
  %%
([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)
--([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east) --++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第一节
--([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
%
  --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)
%
([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
--([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west) --++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
--([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第二节
  --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
%
([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)
--([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west) --++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
--([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第二节
  --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west);}
\def\ys@frame@firstinner{%
  \path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
  ([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
  --([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west) --++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
  ([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第一节
  --([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
  ([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
  --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
  %%
([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)
--([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east) --++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第一节
--([xshift=-\ys@frame@sep]frame.south east)

        ([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)
        --([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west) --++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
        ([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
          --([xshift=\ys@frame@sep]frame.south west);}
\def\ys@frame@middleinner{%
  \path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
    ([xshift=-\ys@frame@sep]frame.north east)--([xshift=-\ys@frame@sep]frame.south east)
    ([xshift=\ys@frame@sep]frame.north west)--([xshift=\ys@frame@sep]frame.south west);}
\def\ys@frame@lastinner{%
  \path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
    ([xshift=-\ys@frame@sep]frame.north east)
    --([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
    ([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
    %
      --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)
%
    ([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
    --([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west) --++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
    ([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
    --([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
    ([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第二节
      --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
%
    ([xshift=\ys@frame@sep]frame.north west)
    --([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
    ([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第二节
      --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west);}
%endregion
%region corner
\def\ys@frame@unbrokencorner{%
  \path[draw=framegolden,line width=1.5\ys@frame@linewidth,line cap=round]
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north west)
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north east)
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south east)
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south west);}
\def\ys@frame@firstcorner{%
  \path[draw=framegolden,line width=1.5\ys@frame@linewidth,line cap=round]
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north west)
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north east);}
\def\ys@frame@middlecorner{}
\def\ys@frame@lastcorner{%
  \path[draw=framegolden,line width=1.5\ys@frame@linewidth,line cap=round]
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south east)
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south west);}
%endregion
\def\ys@frame@star#1#2#3{%
  \begin{scope}[shift={([xshift=#1,yshift=#2]#3)},scale=\ys@frame@ratio*0.1]
    \path[draw=framegolden,fill=white,
      line width=.7\ys@frame@linewidth,line join=round]
      (1,1)..controls(0.3,0.5) and (-0.3,0.5)..
      (-1,1)..controls(-0.5,0.3) and (-0.5,-0.3)..
      (-1,-1)..controls(-0.3,-0.5) and (0.3,-0.5)..
      (1,-1)..controls(0.5,-0.3) and (0.5,0.3)..(1,1)--cycle;
    \path[scale=0.45,fill=framegolden,line join=round]
      (1,1)..controls(0.3,0.7) and (-0.3,0.7)..
      (-1,1)..controls(-0.7,0.3) and (-0.7,-0.3)..
      (-1,-1)..controls(-0.3,-0.7) and (0.3,-0.7)..
      (1,-1)..controls(0.7,-0.3) and (0.7,0.3)..(1,1)--cycle;
  \end{scope}}
\def\ys@frame@segmentation{%
  \draw[color=framegolden,path fading=ys circle]
    ([xshift=5\ys@frame@radius]segmentation.west) to[ornament=88]
    ([xshift=-5\ys@frame@radius]segmentation.east);}

\tcbset{
  % 控制线宽
  ys/frame/line width/.code={\pgfmathsetlength\ys@frame@linewidth{#1}},
  ys/frame/line width=1.4pt,
  % 控制圆弧大小，应为数字，而非长度
  ys/frame/radius/.code={\pgfmathparse{#1}\let\ys@frame@ratio\pgfmathresult
    \pgfmathsetlength\ys@frame@radius{(#1)*1em}%
    \pgfmathsetlength\ys@frame@sep{(#1)*0.5ex}},
  ys/frame/radius=2,
  ys/frame/unbroken/.style={
    interior code={%
      \ys@frame@unbrokenouter % 外框
      \foreach \ii/\jj/\kk in \ys@frame@star@list {\ys@frame@star{\ii}{\jj}{\kk}}; % 星
      \ys@frame@unbrokeninner % 内线
      \ys@frame@unbrokencorner % 四角
    },
    interior titled code={%
      \ys@frame@unbrokenouter % 外框
      \foreach \ii/\jj/\kk in \ys@frame@star@list {\ys@frame@star{\ii}{\jj}{\kk}}; % 星
      \ys@frame@unbrokeninner % 内线
      \ys@frame@unbrokencorner % 四角
    }
  },
  ys/frame/first/.style={
    interior code={%
      \ys@frame@firstouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@t {\ys@frame@star{\ii}{\jj}{\kk}};
      \ys@frame@firstinner
      \ys@frame@firstcorner},
    interior titled code={%
      \ys@frame@firstouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@t {\ys@frame@star{\ii}{\jj}{\kk}};
      \ys@frame@firstinner
      \ys@frame@firstcorner},
  },
  ys/frame/middle/.style={
    interior code={%
      \ys@frame@middleouter
      \ys@frame@middleinner
      \ys@frame@middlecorner}
  },
  ys/frame/last/.style={
    interior code={%
      \ys@frame@lastouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@b {\ys@frame@star{\ii}{\jj}{\kk}};
      \ys@frame@lastinner
      \ys@frame@lastcorner}
  },
  ys/frame style/unbroken/.style={
    boxsep=2\ys@frame@sep,
    left={.8\ys@frame@radius},right={.8\ys@frame@radius},
    ys/frame/unbroken,title hidden,
    segmentation code=\ys@frame@segmentation
  },
  ys/frame style/first/.style={ys/frame/first,title hidden,segmentation code=\ys@frame@segmentation},
  ys/frame style/middle/.style={ys/frame/middle,segmentation code=\ys@frame@segmentation},
  ys/frame style/last/.style={ys/frame/last,segmentation code=\ys@frame@segmentation},
  ys style/.style={frame hidden, 
    ys/frame style/unbroken,
    extras first={ys/frame style/first},
    extras middle={ys/frame style/middle},
    extras last={ys/frame style/last},
  },
}
\makeatother
\newtcolorbox{typicalbox}{enhanced,ys style,breakable}

%% End The Most Beautiful Box
\newcommand\Figure[4]{%
    \begin{center}
    \captionsetup{type=figure} %消除 Package caption Warning: The option `hypcap=true' will be ignored for this
%(caption)                particular \caption on input line XX.警告信息
        \includegraphics[#1]{#2}
        \captionof{figure}{#3}\label{#4}
    \end{center}
}%用法 : 用于tcolorbox中插入图片
\newcommand\Tikz[3]{%
    \begin{center}
    \captionsetup{type=figure} %消除 Package caption Warning: The option `hypcap=true' will be ignored for this(caption)                particular \caption on input line XX.警告信息
        #3 %最后一个参数为Tikz画图代码窗口
        \captionof{figure}{#1}\label{#2} %第一与第二个参数是Tikz画图的名称与标签
    \end{center}
} %用法 : 用于tcolorbox中插入Tikz绘图
\graphicspath{{figures/}{Beautybook/images/}} %图片相对路径
%%===================================================%%
%                                                          公式标注                                                               %%
%%===================================================%%
%%标记内容的命令 (作用是创建标记点的标签名称与要编辑内容间的链接,以便于在Tikz中引用该标签时相当于引用要标记内容所处位置)
% Commands for Highlighting text -- non tikz method
\newcommand{\highlight}[2]{\colorbox{#1!17}{$\displaystyle #2$}}
%\newcommand{\highlight}[2]{\colorbox{#1!17}{$#2$}}
\newcommand{\highlightdark}[2]{\colorbox{#1!47}{$\displaystyle #2$}}
% Commands for Highlighting text -- non tikz method
\renewcommand{\highlight}[2]{\colorbox{#1!17}{#2}}
\renewcommand{\highlightdark}[2]{\colorbox{#1!47}{#2}}
%%%综合标记命令为一条
\newcommand\Tikzmark[3]{
    \tikzmarknode{#1}{\highlight{#2}{$#3$}} %% #1-- Tikzmarknode (即标记点的标签名称设置) ; #2 -- 标记颜色 ; #3 -- 要标记的内容
}
%%===================================================%%
%                                                          公式标注                                                               %%
%%===================================================%%
