%This Class is based on the default book class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Beautybook v6.0}[15-01-2023 v6.0 Beautybook Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[zihao=-4,fontset=windows,twoside,UTF8]{ctexbook}
\overfullrule=1pt
\usepackage[dvipsnames,svgnames,x11names,table]{xcolor}
\colorlet{outermarginfgcolor}{DarkCyan} % foregroundcolor 较深
\colorlet{outermarginbgcolor}{DarkCyan!30} % backgroundcolor 较浅
\usepackage{cncolours}
\usepackage{pgfornament-han}
\usepackage{tikz}
\usetikzlibrary{calc,shadows,hobby,intersections, decorations.markings, decorations.pathreplacing,spy,arrows,shapes,fadings,trees,mindmap,patterns,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,graphs, quotes, angles,decorations.pathmorphing,through,shadings,backgrounds,positioning,fit,arrows.meta,shapes.misc,decorations.shapes}
\RequirePackage{pgfplots} %画图 %%页面样式设计核心包 %提供\pgfonlayer命令以及下列图层指令
\pgfplotsset{compat=1.18}
\usepackage{stys/imagecover}
\usepackage{stys/bottompage}
\usepackage{amssymb,amsfonts}
\usepackage{makeidx}
\usepackage{etoolbox} % 判断函数
\usepackage{paracol}
% \usepackage{etoc}
\usepackage{imakeidx}
\usepackage{anyfontsize}
\usepackage{calc}
\usepackage{xkeyval,ifthen}
\usepackage[backgroundcolor=yellow!40!cyan!20,bordercolor=yellow!40!cyan!20,linecolor=DarkCyan]{todonotes}
\usepackage{varwidth}
\usepackage[colorlinks,linkcolor = black,		%%修改此处为你想要的颜色
anchorcolor = black,	%%修改此处为你想要的颜色
urlcolor = black,		%%修改此处为你想要的颜色
citecolor = black,		%%修改此处为你想要的颜色
]{hyperref}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}%增加编号深度
\usepackage{dashrule}
\newlength\outermarginwidth
\setlength\outermarginwidth{1.5cm}
\newlength\covershift
\setlength\covershift{5cm}
\usepackage{caption}
% 图注与表注格式
\colorlet{captioncolor}{outermarginfgcolor} % 图片和表格题注文字颜色
\makeatletter
%%----------------------------------封面信息定义--------------------------------------------------------%%
\newcommand*\bookseries[1]{\def\@bookseries{#1}}
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\edition[1]{\def\@edition{#1}}
\newcommand*\presslogo[1]{\def\@presslogo{#1}}
\newcommand*\pressname[1]{\def\@pressname{#1}}
\newcommand*\coverimage[1]{\def\@coverimage{#1}}
%%----------------------------------封面信息定义--------------------------------------------------------%%
\makeatother
\usepackage{indentfirst}
\usepackage{physics}
\definecolor{nuanbai}{HTML}{f8f8f8} % F5F5F5
\pagecolor{nuanbai!50}
\usepackage{amsmath}
\usepackage{zhlipsum}
\setmainfont{XITS}
\usepackage[left=2cm,right=2cm,top=.6cm,bottom=3.3cm]{geometry}
\usepackage{xpatch}%修正章节编号
\usepackage[automark]{scrlayer-scrpage}%页面设置宏包,隶属于koma-script文档类
\usepackage{fontawesome5}
\usepackage{mathrsfs}
\usepackage[most]{tcolorbox}
\tcbuselibrary{breakable, skins,theorems}%TcolorBox Library
\usepackage{tabularx}
\usepackage{lastpage}
\usepackage{twemojis}
\usepackage{ninecolors}
\usepackage{colortbl} %彩色表格
\usepackage{tabularray}
\usepackage{pgfornament}
\usepackage{zhnumber}
\usepackage{dashrule}
\usepackage{adjustbox}
\usepackage{enumitem}
\usepackage{multicol}
\usepackage{amsthm}
\RequirePackage{thmtools,thm-restate}%定理环境 %定理的重写
\usepackage{bclogo}
\usepackage{ulem}
\RequirePackage{pgfplots} %画图 %%页面样式设计核心包 %提供\pgfonlayer命令以及下列图层指令
\pgfplotsset{compat=1.18}
\usepackage{graphicx}%修正minipage顶部对齐问题
\pgfdeclarelayer{background} %背景%底层
\pgfdeclarelayer{foreground} %上层
\pgfdeclarelayer{top} %顶部
\pgfdeclarelayer{bottom} %底部
\pgfsetlayers{bottom,background,main,foreground,top}
\newcommand{\tikzoverlay}[1]{\begin{tikzpicture}[remember picture,overlay] #1 \end{tikzpicture}}
\usepackage[explicit]{titlesec}
\newtheorem{defi}{\textbf{Definition}}[section]
\newtheorem{thm}{\textbf{Theorem}}[section]
\newtheorem{lem}{\textbf{Lemma}}[section]
\newtheorem{prop}{\textbf{Proposition}}[section]
\renewcommand{\proofname}{\textbf{Proof.}}
\newtheorem{exam}{\textbf{Example}}[chapter]
\newtheorem{cor}{\textbf{Corollary}}[chapter]
\newtheorem*{remark}{\textbf{Remark}}
% tcolorbox中插入图片或者tikz绘图方法
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
%特殊注释矩阵
\newcommand\coolover[2]{\mathrlap{\smash{\overbrace{\phantom{%
					\begin{matrix} #2 \end{matrix}}}^{\mbox{$#1$}}}}#2}

\newcommand\coolunder[2]{\mathrlap{\smash{\underbrace{\phantom{%
					\begin{matrix} #2 \end{matrix}}}_{\mbox{$#1$}}}}#2}

\newcommand\coolleftbrace[2]{%
	#1\left\{\vphantom{\begin{matrix} #2 \end{matrix}}\right.}

\newcommand\coolrightbrace[2]{%
	\left.\vphantom{\begin{matrix} #1 \end{matrix}}\right\}#2}
\definecolor{lightergray}{gray}{0.99}
\colorlet{CyaN}{yellow!40!cyan}
\colorlet{OrangE}{yellow!20!orange}
\colorlet{BluE}{cyan!70!blue}
\colorlet{ReD}{red!20!orange}
\colorlet{GreeN}{yellow!40!green}
\tcolorboxenvironment{thm}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=CyaN!10, boxrule=0pt, top=2pt, bottom=2pt, left=2.5mm, borderline west={1.5mm}{0mm}{CyaN}, frame hidden}
\tcolorboxenvironment{defi}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=ReD!5, boxrule=0pt, top=2pt, bottom=2pt, left=2.5mm, borderline west={1.5mm}{0mm}{ReD}, frame hidden}
\tcolorboxenvironment{lem}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=BluE!5, boxrule=0pt, top=2pt, bottom=2pt, left=2.5mm, borderline west={1.5mm}{0mm}{BluE}, frame hidden}
\tcolorboxenvironment{prop}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=OrangE!5, boxrule=0pt, top=2pt, bottom=2pt, left=2.5mm, borderline west={1.5mm}{0mm}{OrangE}, frame hidden}
\tcolorboxenvironment{exam}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=GreeN!5, boxrule=0pt, top=2pt, bottom=2pt, left=2.5mm, borderline west={1.5mm}{0mm}{DarkGreen}, frame hidden}
\tcolorboxenvironment{cor}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=violet!5, boxrule=0pt, top=2pt, bottom=2pt, left=2.5mm, borderline west={1.5mm}{0mm}{violet}, frame hidden}
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.5em) node {\makebox[1em][c]{\small #1}};}}
\newcommand{\twicecircle}{\raisebox{.7ex}{
    \begin{tikzpicture}[remember picture,overlay]
        \draw[line width=0.6pt,black!60] (0,0) circle (3pt);
        \fill[black]  (0,0) circle (1.6pt) ;
    \end{tikzpicture}}
}
\newcommand{\exercise}[2][\bcicosaedre]{\bigskip
\begin{tikzpicture}[remember picture,overlay]
\draw[line width=2pt,loosely dotted,teal] (0,0)--node[pos=0.4,rectangle,minimum height=1.5em,font=\sffamily\Large,text=black,fill=black!2,drop shadow={opacity=.3, shadow xshift=0.1cm},anchor=center,
	inner sep=1.5mm,
	anchor=west,] {$#1$  ~ #2} (\linewidth,0);
\end{tikzpicture}\bigskip\smallskip
}
\usepackage{extarrows}
\newcommand{\R}{\mathbb{R}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\lan}[1]{\langle #1 \rangle}
\newenvironment{eq}[1]{\begin{equation}\begin{aligned}#1}{\end{aligned}\end{equation}} %有编号
\newenvironment{eq*}[1]{\begin{equation*}\begin{aligned}#1}{\end{aligned}\end{equation*}} %无编号
\everymath{\displaystyle}

%% -------- 章节样式
\titleformat{\chapter}{\huge\bfseries\filcenter}{}{1em}{
    \begin{tikzpicture}[remember picture, overlay]%
      \begin{pgfonlayer}{bottom}
        \shade[left color=outermarginbgcolor!10,middle color=outermarginbgcolor!50,right color=outermarginfgcolor!20] (current page.north west) rectangle ++(\paperwidth,-.2\paperheight);
        \fill[outermarginfgcolor,opacity=.5]([shift={(0,-4.25cm)}]current page.north west) rectangle ++(\paperwidth,-2mm);
      \end{pgfonlayer}
      \ifodd\value{page}
        \node[right,text=outermarginfgcolor] (chapnum) at ([shift={(3.5cm,-2.7cm)}]current page.north west) {\scalebox{3}{\thechapter}};
        \node[left,font=\huge\bfseries] (contents name) at ([shift={(0cm,-3cm)}]current page.north east) {\begin{varwidth}{\linewidth}\baselineskip=2.6ex  #1\end{varwidth}};
        \begin{pgfonlayer}{background}
        \node[right] (image) at ([shift={(0,-2.5cm)}]current page.north west) {\includegraphics[width=3cm]{figures/hehua.png}};
        \end{pgfonlayer}
        \else
        \node[left,text=outermarginfgcolor] (chapnum) at ([shift={(-3.5cm,-2.7cm)}]current page.north east) {\scalebox{3}{\thechapter}};
      \node[right,font=\huge\bfseries] (contents name) at ([shift={(0cm,-3cm)}]current page.north west) {\begin{varwidth}{\linewidth}\baselineskip=2.6ex  #1\end{varwidth}};
      \begin{pgfonlayer}{background}
      \node[left] (image) at ([shift={(0,-2.5cm)}]current page.north east) {\includegraphics[width=3cm]{figures/hehua.png}};
      \end{pgfonlayer}
        \fi
        \end{tikzpicture}
    }
\titleformat{name=\chapter,numberless}{\bfseries\huge\filcenter}{}{1em}{
    \begin{tikzpicture}[remember picture, overlay]%
      \begin{pgfonlayer}{bottom}
        \shade[left color=outermarginbgcolor!10,middle color=outermarginbgcolor!50,right color=outermarginfgcolor!20] (current page.north west) rectangle ++(\paperwidth,-.2\paperheight);
        \fill[outermarginfgcolor,opacity=.5]([shift={(0,-4.25cm)}]current page.north west) rectangle ++(\paperwidth,-2mm);
      \end{pgfonlayer}
        \node[left,font=\huge\bfseries] (contents name) at ([shift={(0cm,-3cm)}]current page.north east) {\begin{varwidth}{.9\linewidth}\baselineskip=2.6ex #1\end{varwidth}};
        \begin{pgfonlayer}{background}
        \node[right] (image) at ([shift={(0,-2.2cm)}]current page.north west) {\includegraphics[width=3cm,angle =45]{figures/flower.png}};
        \end{pgfonlayer}
        \end{tikzpicture}
}
\titlespacing{\chapter}{0pt}{0pt}{65pt}
% -------- Part定制
\makeatletter
\newcommand*\partabstract[1]{\def\@partabstract{#1}}
\newcommand*\partimage[1]{\def\@partimage{#1}}
\titleformat{\part}
{\normalfont\huge\filcenter}
{}
{20pt}
{\begin{tikzpicture}[remember picture,overlay]
    \def\barwidth{2cm}
        \fill[outermarginbgcolor,opacity=0.6]
    (current page.north west) rectangle (current page.south east);
    \ifodd\value{page}
        \fill[outermarginfgcolor]
    (current page.north east) rectangle ++(-\barwidth,-\paperheight);
        \node[] (hbar) at ($(current page.north)!0.33!(current page.south)$) {
            \begin{tikzpicture}
                \fill[white] 
                (0,0) rectangle ++(\paperwidth,-1cm);
                \fill[outermarginbgcolor]
                (0,-.25cm) rectangle ++(\paperwidth,-.5cm);
                \fill[outermarginfgcolor]
                (.67\paperwidth,-.25cm) rectangle ++(4.5cm,-.5cm);
                \fill[outermarginfgcolor!20!white]
                (.67\paperwidth-1mm,-.25cm) rectangle ++(1mm,-.5cm);
                \fill[outermarginfgcolor!20!white]
                (.67\paperwidth+4.4cm,-.25cm) rectangle ++(1mm,-.5cm);
            \end{tikzpicture}
        };
        \node[above,font=\sffamily\huge,shift={(.33\linewidth,.5\barwidth)}] (partname) at (hbar) {Part \thepart};
        \node[below,left,font=\bfseries\huge,shift={(.146\linewidth,-1.5*\barwidth)}] (partcontents) at (partname) {\begin{varwidth}{.8\linewidth}\raggedright\baselineskip=2.8ex  #1 \end{varwidth}}; % 标题名称
          \begin{pgfonlayer}{background}
            \node[above,shift={(-.4\linewidth,-4*\barwidth)},opacity=0.8] at (partname) {\ifdefvoid{\@partimage}{}{\includegraphics[width=1.2\linewidth]{\@partimage}}}; % 图片位置调整
            \end{pgfonlayer}
          \else 
          \fill[outermarginfgcolor]
          (current page.north west) rectangle ++(\barwidth,-\paperheight);
              \node[] (hbar) at ($(current page.north)!0.33!(current page.south)$) {
                  \begin{tikzpicture}
                      \fill[white] 
                      (0,0) rectangle ++(\paperwidth,-1cm);
                      \fill[outermarginbgcolor]
                      (0,-.25cm) rectangle ++(\paperwidth,-.5cm);
                      \fill[outermarginfgcolor]
                      (.15\paperwidth,-.25cm) rectangle ++(4.5cm,-.5cm);
                      \fill[outermarginfgcolor!20!white]
                      (.15\paperwidth-1mm,-.25cm) rectangle ++(1mm,-.5cm);
                      \fill[outermarginfgcolor!20!white]
                      (.15\paperwidth+4.5cm,-.25cm) rectangle ++(1mm,-.5cm);
                  \end{tikzpicture}
              };
              \node[above,font=\sffamily\huge,shift={(-.31\linewidth,.5\barwidth)}] (partname) at (hbar) {Part \thepart};
              \node[below right,font=\bfseries\huge,shift={(-.125\linewidth,-1.2*\barwidth)}] (partcontents) at (partname) {\begin{varwidth}{.8\linewidth}\raggedright\baselineskip=2.8ex  #1 \end{varwidth}}; % 标题名称
                \begin{pgfonlayer}{background}
                  \node[above,shift={(.4\linewidth,-4*\barwidth)},opacity=0.8] at (partname) {\ifdefvoid{\@partimage}{}{\includegraphics[width=1.2\linewidth]{\@partimage}}}; % 图片位置调整
                  \end{pgfonlayer}
          \fi
        \node[below,,font=\kaishu\fontsize{13}{13}\selectfont,shift={(0\linewidth,-1.65*\barwidth)}] at (hbar) {\ifdefvoid{\@partabstract}{}{\begin{varwidth}{.85\linewidth}\baselineskip=3ex \@partabstract\end{varwidth}}}; % 简介文字调整
    \end{tikzpicture}}
\makeatother
\assignpagestyle{\part}{empty}
\assignpagestyle{\chapter}{empty}
%% -- Section 
\titleformat{\section}
{}
{}
{-.5em} %左右移动\thesection标签位置
{\begin{tikzpicture}[remember picture,overlay]
    \def\rad{7pt}
    \def\Rad{3.5pt}
    \def\tlength{3cm}
    \def\theight{0.8cm}
    \coordinate (sec) at (.6cm,0);
    \fill[color=outermarginfgcolor!80!black] ([xshift=\tlength-\Rad,yshift=5pt]sec.north west) coordinate (secnw) to[out=0,in=90,looseness=0.7] ([xshift=\tlength+0.5*\Rad]sec.north west) coordinate (NW)--([xshift=-2*\rad]NW)--cycle;
    \path[fill=outermarginfgcolor,drop shadow={opacity=0.3,shadow xshift=.05cm,shadow yshift=-.05cm}]
    ([xshift=\rad,yshift=5pt]sec.north west) coordinate (topleft) to[out=180,in=0,looseness=1] ([xshift=-3*\rad,yshift=-\theight]sec.north west) --([xshift=\tlength-4*\rad,yshift=-\theight]sec.north west) coordinate (bottomright) to[out=0,in=180] ([xshift=\tlength,yshift=5pt]sec.north west) --cycle;
    \coordinate (SecName) at ($(topleft)!0.5!(bottomright)$);
    \node[text=white,font=\rmfamily\large\bfseries] at (SecName) {Sec \thesection};
    \node[text=black,font=\rmfamily\bfseries\Large,below right] (secnum) at ([shift={(.1cm,-.16cm)}]secnw) {\begin{varwidth}{.8\linewidth}\baselineskip=22.5pt #1\end{varwidth}};
\end{tikzpicture}}%[\addvspace{.5pc}]效果与在下面更改35pt变大一致, 最后一个选项为 [<after code>]
\titlespacing{\section}{0pt}{0pt}{35pt}
% 侧边条
\newlength\chapternumbersize
\setlength\chapternumbersize{40pt}
\setlength{\headheight}{40pt} % 页眉高度
\usepackage{xpatch}
\usepackage{scrlayer-scrpage}
\renewcommand\chaptermarkformat{}
% define a new mark for the chapter number
\newmarks\chapternum
\xapptocmd\chaptermark{\marks\chapternum{\thechapter}}{}{\PatchFailed}
\newmarks\secnum
\xapptocmd\sectionmark{\marks\secnum{\thesection}}{}{\PatchFailed}

\newcommand*\outermarginpagemark{%
\tikzoverlay{
    \begin{pgfonlayer}{top}
    \ifodd\value{page}
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.north east) --++(-5pt,-0.15cm)--++(-\outermarginwidth+10pt,0) --++(-5pt,0.15cm)--cycle;
    \coordinate (anchor of headmark) at ([shift={(-1.2\outermarginwidth,-0.2cm)}]current page.north east);
    \node[below ,text=outermarginfgcolor,font=\rodondo\bfseries\fontsize{20}{20}\selectfont] at ([shift={(-.5\outermarginwidth,-0.2cm)}]current page.north east) {\thepage};
    \node[below left,font=\upshape,text=outermarginfgcolor] at (anchor of headmark) {\begin{varwidth}{\linewidth}\rightmark\end{varwidth}};
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.south east) --++(-5pt,0.15cm)--++(-\outermarginwidth+10pt,0) --++(-5pt,-0.15cm)--cycle;
    \else
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.north west) --++(5pt,-0.15cm)--++(\outermarginwidth-10pt,0) --++(5pt,0.15cm)--cycle;
    \coordinate (anchor of headmark) at ([shift={(1.2\outermarginwidth,-0.2cm)}]current page.north west);
    \node[below ,text=outermarginfgcolor,font=\rodondo\bfseries\fontsize{20}{20}\selectfont] at ([shift={(.5\outermarginwidth,-0.2cm)}]current page.north west) {\thepage};
    \node[below right,font=\upshape,text=outermarginfgcolor] at (anchor of headmark) {\begin{varwidth}{\linewidth}\rightmark\end{varwidth}};
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.south west) --++(5pt,0.15cm)--++(\outermarginwidth-10pt,0) --++(5pt,-0.15cm)--cycle;
    \fi
    \end{pgfonlayer}}
}
\newlength\baryshift
\setlength\baryshift{-2.5\outermarginwidth} 
\makeatletter
% Add A Side-Bar Box For The Chapter Number
\newcommand*\outermarginchapternumberbox{%
    \if@mainmatter
    \tikzoverlay{
    \shade[top color=outermarginfgcolor!90,bottom color=outermarginbgcolor] 
        (\outermarginwidth,-.5\outermarginwidth) rectangle (0,-1.5\outermarginwidth);
    \node[anchor=center,text=white,font=\rodondo\bfseries] at (1/2*\outermarginwidth,-\outermarginwidth) {\usekomafont{chapternumber}{\botmarks\chapternum}};%
    }
    \fi
    \vfill
}
\makeatother

\newkomafont{chapternumber}{%页边章节编号字体
	\fontsize{\chapternumbersize}{\chapternumbersize}\selectfont
}%
\makeatletter
\newcommand\outermarginmark{
	\ifodd\value{page}\hfill\else\hspace*{\dimexpr\outermarginwidth*3/8\relax}\fi
	\rotatebox{90}{\parbox{\layerheight}{
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
}
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
\DeclareNewLayer[
	background, % 下层(背景)
	evenpage,
	outermargin,
	width=\outermarginwidth,
	contents={\color{outermarginbgcolor}\rule{\layerwidth}{\layerheight}} %色彩装饰条
]{scth.outermargin.bg.even}%
%%=============%                 页边条颜色              %=======================%%
\tikzfading[name=fade south,
                    top color =transparent!0,
                    bottom color=transparent!80]
\tikzfading[name=fade north,
                    top color =transparent!100,
                    bottom color=transparent!0]
%偶数页边纹理效果设置
\newcommand{\evensidbardeepcolor}{%
\tikzoverlay{
\ifodd\value{page}
\fill [outermarginfgcolor!20]%
        (current page.north east) rectangle ([xshift=-\outermarginwidth,yshift=0]current page.south east);
    \pattern [pattern=checkerboard,pattern color=outermarginfgcolor!50]%
        (current page.north east) rectangle ([xshift=-\outermarginwidth,yshift=0]current page.south east);
    \fill [outermarginbgcolor!90,path fading=fade south]%
        ([yshift=1mm]current page.north east) rectangle ([xshift=-\outermarginwidth,yshift=-.5\layerheight]current page.north east);
    \fill [outermarginbgcolor,path fading=fade north]%
    (current page.south east) rectangle ([xshift=-\outermarginwidth,yshift=.2\layerheight]current page.south east);
\else
    \fill [outermarginfgcolor!20]%
    (current page.north west) rectangle ([xshift=\outermarginwidth,yshift=0]current page.south west);
    \pattern [pattern=checkerboard,pattern color=outermarginfgcolor!50]%
        (current page.north west) rectangle ([xshift=\outermarginwidth,yshift=0]current page.south west);
    \fill [outermarginbgcolor!90,path fading=fade south]%
        ([yshift=1mm]current page.north west) rectangle ([xshift=\outermarginwidth,yshift=-.5\layerheight]current page.north west);
    \fill [outermarginbgcolor,path fading=fade north]%
    (current page.south west) rectangle ([xshift=\outermarginwidth,yshift=.2\layerheight]current page.south west);
    \fi
}
}
%%==============偶数页页边条颜色========================%%
\DeclareNewLayer[
	foreground, %
	evenpage,
	outermargin,
	width=\outermarginwidth,
	contents=\evensidbardeepcolor %色彩装饰条
]{scth.outermargin.fg.even}%
%%==============偶数页页脚页码========================%%
\DeclareNewLayer[
	foreground, %上层 (背景之上)
	evenpage,
	foot, % 页脚
	contents=\outermarginpagemark
]{scth.outermargin.pn.even}%
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
%%======================章节名称===================================%%
\DeclareNewLayer[
	clone=scth.outermargin.cn.even,
	addheight=\dimexpr\headheight+\headsep+\textheight\relax,
    addvoffset=\dimexpr+2\outermarginwidth\relax,
    hoffset=-2.5pt,
	contents=\outermarginmark %
]{scth.outermargin.text.even}%

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
\DeclareOddFromEven{scth.outermargin.cn}
\DeclareOddFromEven{scth.outermargin.text}
\DeclareOddFromEven{scth.outermargin.fg}

% add the layers to page style scrheadings and page style plain
\ForEachLayerOfPageStyle*{scth}{%
	\AddLayersToPageStyle{scrheadings}{#1}%
	\AddLayersToPageStyle{plain.scrheadings}{#1}%
}
%----------------------------------------------
\KOMAoptions{markcase=upper} %页眉
% for page styles scrheadings and plain
\clearpairofpagestyles
\ohead{}
\cfoot{}
\ofoot{}
% set the contents of the outer margin on even and odd pages for scrheadings, plain and scth
\oddoutermargin{\bf\leftmark} % Odd 奇数页
\makeatletter
\evenoutermargin{\cabin\bfseries\@title} % Even 偶数页
\makeatother
%% Begin The Most Beautiful Box (STYLE : ys style) % 中国风盒子
\makeatletter
% \definecolor{framegolden}{HTML}{CC2F69} % 控制外框颜色
\colorlet{framegolden}{outermarginfgcolor}
\colorlet{framegray}{outermarginbgcolor!50}
% \definecolor{framegray}{HTML}{e2dbbe} % 控制填充颜色
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
\newtcolorbox{fancybox}{enhanced,ys style,breakable}
%% End The Most Beautiful Box
% 定理环境 
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
\newcounter{tcbdefinition}
\renewcommand{\thetcbdefinition}{\thesection.\arabic{tcbdefinition}}
\def\tcbdefinitionautorefname{\bf Definition}
%
\newcounter{tcbexam}
\renewcommand{\thetcbexam}{\thesection.\arabic{tcbexam}}
\def\tcbexamautorefname{\bf Example}

\newcommand{\Example}{Example}
\newcommand{\Proofs}{Proof}
\newcommand{\Solutions}{Solution}
\newcommand{\Definition}{Definition}
\newcommand{\Lemma}{Lemma}
\newcommand{\Proposition}{Proposition}
\newcommand{\Theorem}{Theorem}
\newcommand{\Corollary}{Corollary}

\tikzset{
	wnodeTheorem/.style={%
		rectangle,top color=lightergray, bottom color=lightergray,
		inner sep=1mm,anchor=west,font=\bfseries\rmfamily},
}
	\newtcolorbox{wwtheorem}[3][]{
		arc=3pt,breakable,enhanced,colback=nuanbai,boxrule=0pt,top=8mm,
    fuzzy shadow={-0.6mm}{0.6mm}{0mm}{0.3mm}{white!50!gray},% 上
    fuzzy shadow={0.6mm}{-0.6mm}{0mm}{0.3mm}{fill=white!40!gray},%下
    opacityframe=0, opacityback=0.98,
		fontupper=\itshape, step and label={tcbthm}{#3},
		overlay unbroken = {
			%标题 %更改有效
			\node[rectangle, 
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=purple5,
	anchor=west,rounded corners=3pt,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\bf   \Theorem\ \thetcbthm.~#2};
            \fill[color=purple5,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
      \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
      \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[purple5,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			%标题 %跨页时生效
			\node[rectangle, 
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=purple5,
	anchor=west,rounded corners=3pt,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\bf  \Theorem\ \thetcbthm.~#2};
            \fill[color=purple5,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			%%============================%% End
            \fill[purple5,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{theorem}{O{} O{} O{}}{\smallskip\begin{wwtheorem}{#1}{#2}#3}{\end{wwtheorem} \smallskip}
%引理
%% fuzzy shadow={〈xshift〉}{〈yshift〉}{〈offset〉}{〈step〉}{〈options〉}

% fuzzy shadow是tcolorbox提供的诸多shadow模式中的一种，它的主要特色是会让阴影区有一种渐变的效果，类似于边缘糊化。

% 具体可以看下面的效果，我对阴影区做了一些夸张地处理，可以看到它产生了颜色的一个渐变过程。

%% 其中xshift和yshift是指阴影部分相对于主体部分的偏移量，如果均为0，那阴影和主体部分会重合在一起。取正值代表向上和向右移动，相反取负值。在我们的例子中，第一个fuzzy shadow向左向上移动，所以第一个参数为负值，第二个刚好相反。

% 第三个参数：offset可以扩大或者缩小已有的阴影面积，取负值为扩大，取正值为缩小。如果前两个参数设置合理，是不需要offset取值，直接设为0即可。

% 第四个参数：step就决定了阴影部分的效果，这个值如果取0，那么阴影区没有糊化，即没有渐变的效果。一个合适的取值可以调整其视觉效果。
\newtcolorbox{wwlemma}[3][]{
		arc=0mm,breakable,enhanced,colback=nuanbai,arc=3pt,boxrule=0pt,top=8mm,
      fuzzy shadow={-0.6mm}{0.6mm}{0mm}{0.3mm}{white!50!gray},% 上
      fuzzy shadow={0.6mm}{-0.6mm}{0mm}{0.3mm}{fill=white!40!gray},%下
        opacityframe=0, opacityback=0.98,
		fontupper=\normalsize, step and label={tcblemma}{#3},
	% Overlay Unbroken
  overlay unbroken= {
  %%====================== First ============================%% 
	\def\rad{5pt}
	\def\Rad{2.5pt}
	\def\tlength{2.7cm}
	\def\theight{0.6cm}
	\fill[color=DarkCyan!80!black] ([xshift=\tlength-\Rad,yshift=5pt]frame.north west) to[out=0,in=90,looseness=0.7] ([xshift=\tlength+0.5*\Rad]frame.north west) coordinate (NW)--([xshift=-2*\rad]NW)--cycle;
    \node[text=DarkCyan,right,
  font=\normalsize\bfseries] at ([xshift=2.5cm,yshift=-2.85mm]frame.north west)%
  {#2};
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=\rad,yshift=5pt]frame.north west) coordinate (topleft) to[out=180,in=0] ([xshift=-2*\rad,yshift=-\theight]frame.north west) --([xshift=\tlength-3*\rad,yshift=-\theight]frame.north west) coordinate (bottomright) to[out=0,in=180] ([xshift=\tlength,yshift=5pt]frame.north west) --cycle;
    \coordinate (LemName) at ($(topleft)!0.5!(bottomright)$);
    \node[text=white,font=\bfseries] at (LemName) {\Lemma~\thetcblemma.};
    %%========================== End ========================%% 
    \def\tlen{1.5cm}
    \fill[color=DarkCyan!80!black] ([xshift=-\tlen+\Rad,yshift=-5pt]frame.south east) to[out=180,in=90,looseness=0.7] ([xshift=-\tlen-0.5*\Rad]frame.south east) coordinate (NWl)--([xshift=2*\rad]NWl)--cycle;
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=-\rad,yshift=-5pt]frame.south east) coordinate (topleftt) to[out=0,in=180] ([xshift=2*\rad,yshift=\theight]frame.south east) --([xshift=-\tlen+3*\rad,yshift=\theight]frame.south east) coordinate (bottomrightt) to[out=180,in=0] ([xshift=-\tlen,yshift=-5pt]frame.south east) --cycle;
	},%上面是不跨页时生效,下面代码仅在跨页分割时生效
  % Overlay First
  overlay first={
    \def\rad{5pt}
	\def\Rad{2.5pt}
	\def\tlength{2.7cm}
	\def\theight{0.6cm}
    %%====================== First ============================%% 
    \fill[color=DarkCyan!80!black] ([xshift=\tlength-\Rad,yshift=5pt]frame.north west) to[out=0,in=90,looseness=0.7] ([xshift=\tlength+0.5*\Rad]frame.north west) coordinate (NW)--([xshift=-2*\rad]NW)--cycle;
    \node[text=DarkCyan,right,
  font=\normalsize\bfseries] at ([xshift=2.5cm,yshift=-2.85mm]frame.north west)%
  {#2};
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=\rad,yshift=5pt]frame.north west) coordinate (topleft) to[out=180,in=0] ([xshift=-2*\rad,yshift=-\theight]frame.north west) --([xshift=\tlength-3*\rad,yshift=-\theight]frame.north west) coordinate (bottomright) to[out=0,in=180] ([xshift=\tlength,yshift=5pt]frame.north west) --cycle;
    \coordinate (LemName) at ($(topleft)!0.5!(bottomright)$);
    \node[text=white,font=\bfseries] at (LemName) {\Lemma~\thetcblemma.};
  },
	% Overlay Last
	overlay last = {%跨页时生效 尾部
		%%========================== End ========================%% 
    \def\rad{5pt}
	\def\Rad{2.5pt}
	\def\theight{0.6cm}
    \def\tlen{1.5cm}
    \fill[color=DarkCyan!80!black] ([xshift=-\tlen+\Rad,yshift=-5pt]frame.south east) to[out=180,in=90,looseness=0.7] ([xshift=-\tlen-0.5*\Rad]frame.south east) coordinate (NWl)--([xshift=2*\rad]NWl)--cycle;
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=-\rad,yshift=-5pt]frame.south east) coordinate (topleftt) to[out=0,in=180] ([xshift=2*\rad,yshift=\theight]frame.south east) --([xshift=-\tlen+3*\rad,yshift=\theight]frame.south east) coordinate (bottomrightt) to[out=180,in=0] ([xshift=-\tlen,yshift=-5pt]frame.south east) --cycle;
	}
		#1
	}
\NewDocumentEnvironment{lemma}{O{} O{} O{}}{\smallskip\begin{wwlemma}{#1}{#2}#3}{\end{wwlemma} \smallskip}
%命题
\newtcolorbox{wwproposition}[3][]{
		arc=3pt,breakable,enhanced,colback=nuanbai,boxrule=0pt,top=8mm,fuzzy shadow={-0.6mm}{0.6mm}{0mm}{0.3mm}{white!50!gray},% 上
    fuzzy shadow={0.6mm}{-0.6mm}{0mm}{0.3mm}{fill=white!40!gray},%下
    opacityframe=0, opacityback=0.98,
		fontupper=\normalsize, step and label={tcbproposition}{#3},
		overlay unbroken = {
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=DeepPink,
	anchor=west,rounded corners=3pt,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\Proposition\ \thetcbproposition.~#2};
            \fill[color=DeepPink,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[DeepPink,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			% \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
			%标题 %跨页时生效
			\node[rectangle, %opacity=.3,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=DeepPink,
	anchor=west,rounded corners=3pt,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\Proposition\ \thetcbproposition.~#2};
            \fill[color=DeepPink,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			%%============================%% End
            \fill[DeepPink,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{proposition}{O{} O{} O{}}{\smallskip\begin{wwproposition}{#1}{#2}#3}{\end{wwproposition}\smallskip }
%推论
\newtcolorbox{wwcorollary}[3][]{
		arc=3pt,breakable,enhanced,colback=nuanbai,boxrule=0pt,top=8mm,fuzzy shadow={-0.6mm}{0.6mm}{0mm}{0.3mm}{white!50!gray},% 上
    fuzzy shadow={0.6mm}{-0.6mm}{0mm}{0.3mm}{fill=white!40!gray},%下
    opacityframe=0, opacityback=0.98,
		fontupper=\normalsize, step and label={tcbcorollary}{#3},
		overlay unbroken = {
			\node[rectangle,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=BlueGreen,
	anchor=west,rounded corners=3pt,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\Corollary\ \thetcbcorollary.~#2};
            \fill[color=BlueGreen,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[BlueGreen,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},
		overlay first = {
			\node[rectangle,
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=BlueGreen,
	anchor=west,rounded corners=3pt,
	font=\normalsize\bfseries] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\Corollary\ \thetcbcorollary.~#2};
            \fill[color=BlueGreen,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},
		overlay last = {
			%%============================%% End
            \fill[BlueGreen,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{corollary}{O{} O{} O{}}{\smallskip\begin{wwcorollary}{#1}{#2}#3}{\end{wwcorollary}\smallskip }
% 定义开始
\newtcolorbox{wwdefinition}[3][]{
		arc=3pt,breakable,enhanced,colback=nuanbai,boxrule=0pt,top=8mm,
    fuzzy shadow={-0.6mm}{0.6mm}{0mm}{0.3mm}{white!50!gray},% 上
    fuzzy shadow={0.6mm}{-0.6mm}{0mm}{0.3mm}{fill=white!40!gray},%下
    opacityframe=0, opacityback=0.98,
		fontupper=\itshape, step and label={tcbdefinition}{#3},
		overlay unbroken = {
			%标题 %更改有效
			\node[rectangle, 
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=紫棠!80,
	anchor=west,rounded corners=3pt,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\bf   \Definition\ \thetcbdefinition.~#2};
            \fill[color=紫棠!80,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
      \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
      \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
			%%============================%% End
            \fill[紫棠!80,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		},%上面是实际控制代码,下面的代码仅在跨页分割时生效
		overlay first = {%跨页时生效
			%标题 %跨页时生效
			\node[rectangle, 
	text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},
	inner sep=1.5mm,fill=紫棠!80,
	anchor=west,rounded corners=3pt,
	font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
	{\phantom{\rule{1.2em}{0pt}}\bf  \Definition\ \thetcbdefinition.~#2};
            \fill[color=紫棠!80,drop shadow={opacity=0.3,shadow xshift=.3pt}] 
            ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
		    \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
		    \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
		},%保持边缘的变化
		overlay last = {%跨页时生效
			%%============================%% End
            \fill[紫棠!80,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}] 
            ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
			\fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
			\fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
		}
		#1
	}
\NewDocumentEnvironment{definition}{O{} O{} O{}}{\smallskip\begin{wwdefinition}{#1}{#2}#3}{\end{wwdefinition} \smallskip}
% 例题环境
%% fuzzy shadow={〈xshift〉}{〈yshift〉}{〈offset〉}{〈step〉}{〈options〉}

% fuzzy shadow是tcolorbox提供的诸多shadow模式中的一种，它的主要特色是会让阴影区有一种渐变的效果，类似于边缘糊化。

% 具体可以看下面的效果，我对阴影区做了一些夸张地处理，可以看到它产生了颜色的一个渐变过程。

%% 其中xshift和yshift是指阴影部分相对于主体部分的偏移量，如果均为0，那阴影和主体部分会重合在一起。取正值代表向上和向右移动，相反取负值。在我们的例子中，第一个fuzzy shadow向左向上移动，所以第一个参数为负值，第二个刚好相反。

% 第三个参数：offset可以扩大或者缩小已有的阴影面积，取负值为扩大，取正值为缩小。如果前两个参数设置合理，是不需要offset取值，直接设为0即可。

% 第四个参数：step就决定了阴影部分的效果，这个值如果取0，那么阴影区没有糊化，即没有渐变的效果。一个合适的取值可以调整其视觉效果。
\newtcolorbox{wwexample}[3][]{
		arc=0mm,breakable,enhanced,colback=CyaN!10,arc=3pt,boxrule=0pt,top=8mm,%drop fuzzy shadow=black!20!white,
      fuzzy shadow={-0.6mm}{0.6mm}{0mm}{0.3mm}{white!50!gray},% 上
      fuzzy shadow={0.6mm}{-0.6mm}{0mm}{0.3mm}{fill=white!40!gray},%下
        opacityframe=0, opacityback=0.98,
		fontupper=\normalsize, step and label={tcbexam}{#3},
	% Overlay Unbroken
  overlay unbroken= {
  %%====================== First ============================%% 
	\def\rad{5pt}
	\def\Rad{2.5pt}
	\def\tlength{2.7cm}
	\def\theight{0.6cm}
	\fill[color=DarkCyan!80!black] ([xshift=\tlength-\Rad,yshift=5pt]frame.north west) to[out=0,in=90,looseness=0.7] ([xshift=\tlength+0.5*\Rad]frame.north west) coordinate (NW)--([xshift=-2*\rad]NW)--cycle;
    \node[text=DarkCyan,right,
  font=\normalsize\bfseries] at ([xshift=2.5cm,yshift=-2.85mm]frame.north west)%
  {#2};
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=\rad,yshift=5pt]frame.north west) coordinate (topleft) to[out=180,in=0] ([xshift=-2*\rad,yshift=-\theight]frame.north west) --([xshift=\tlength-3*\rad,yshift=-\theight]frame.north west) coordinate (bottomright) to[out=0,in=180] ([xshift=\tlength,yshift=5pt]frame.north west) --cycle;
    \coordinate (LemName) at ($(topleft)!0.5!(bottomright)$);
    \node[text=white,font=\bfseries] at (LemName) {\Example~\thetcbexam.};
    %%========================== End ========================%% 
    \def\tlen{1.5cm}
    \fill[color=DarkCyan!80!black] ([xshift=-\tlen+\Rad,yshift=-5pt]frame.south east) to[out=180,in=90,looseness=0.7] ([xshift=-\tlen-0.5*\Rad]frame.south east) coordinate (NWl)--([xshift=2*\rad]NWl)--cycle;
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=-\rad,yshift=-5pt]frame.south east) coordinate (topleftt) to[out=0,in=180] ([xshift=2*\rad,yshift=\theight]frame.south east) --([xshift=-\tlen+3*\rad,yshift=\theight]frame.south east) coordinate (bottomrightt) to[out=180,in=0] ([xshift=-\tlen,yshift=-5pt]frame.south east) --cycle;
	},%上面是不跨页时生效,下面代码仅在跨页分割时生效
  % Overlay First
  overlay first={
    \def\rad{5pt}
	\def\Rad{2.5pt}
	\def\tlength{2.7cm}
	\def\theight{0.6cm}
    %%====================== First ============================%% 
    \fill[color=DarkCyan!80!black] ([xshift=\tlength-\Rad,yshift=5pt]frame.north west) to[out=0,in=90,looseness=0.7] ([xshift=\tlength+0.5*\Rad]frame.north west) coordinate (NW)--([xshift=-2*\rad]NW)--cycle;
    \node[text=DarkCyan,right,
  font=\normalsize\bfseries] at ([xshift=2.5cm,yshift=-2.85mm]frame.north west)%
  {#2};
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=\rad,yshift=5pt]frame.north west) coordinate (topleft) to[out=180,in=0] ([xshift=-2*\rad,yshift=-\theight]frame.north west) --([xshift=\tlength-3*\rad,yshift=-\theight]frame.north west) coordinate (bottomright) to[out=0,in=180] ([xshift=\tlength,yshift=5pt]frame.north west) --cycle;
    \coordinate (LemName) at ($(topleft)!0.5!(bottomright)$);
    \node[text=white,font=\bfseries] at (LemName) {\Example~\thetcblemma.};
  },
	% Overlay Last
	overlay last = {%跨页时生效 尾部
		%%========================== End ========================%% 
    \def\rad{5pt}
	\def\Rad{2.5pt}
	\def\theight{0.6cm}
    \def\tlen{1.5cm}
    \fill[color=DarkCyan!80!black] ([xshift=-\tlen+\Rad,yshift=-5pt]frame.south east) to[out=180,in=90,looseness=0.7] ([xshift=-\tlen-0.5*\Rad]frame.south east) coordinate (NWl)--([xshift=2*\rad]NWl)--cycle;
    \path[fill=DarkCyan,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=-\rad,yshift=-5pt]frame.south east) coordinate (topleftt) to[out=0,in=180] ([xshift=2*\rad,yshift=\theight]frame.south east) --([xshift=-\tlen+3*\rad,yshift=\theight]frame.south east) coordinate (bottomrightt) to[out=180,in=0] ([xshift=-\tlen,yshift=-5pt]frame.south east) --cycle;
	}
		#1
	}
\NewDocumentEnvironment{example}{O{} O{} O{}}{\smallskip\begin{wwexample}{#1}{#2}#3}{\end{wwexample} \smallskip}
% proof
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
%% --------参考文献
\usepackage[
backend=biber,
style=numeric,
sorting=nty
]{biblatex}
\addbibresource{ref.bib}
\indexsetup{level=\chapter*,noclearpage}
\makeindex[title=索引,columns=3,columnsep=15pt,columnseprule]
\makeindex