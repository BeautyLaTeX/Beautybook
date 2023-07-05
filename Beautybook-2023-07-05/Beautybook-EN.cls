%This Class is based on the default book class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Beautybook-EN}[2023-07-01 V7.5 Beautybook Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[twoside]{book}
\overfullrule=1pt
\RequirePackage[fontsize=13.5pt]{fontsize}
\linespread{1.05}
\RequirePackage[dvipsnames,svgnames,x11names,table]{xcolor}
\colorlet{outermarginfgcolor}{DarkCyan} % foregroundcolor 较深
\colorlet{outermarginbgcolor}{DarkCyan!30} % backgroundcolor 较浅
\definecolor{高粱红}{HTML}{951c48}
\RequirePackage{cncolours}
\RequirePackage{bropd} % math 自适应数学括号命令 \br{} !!!
\RequirePackage{tikz-imagelabels} % tikz图像标注
\RequirePackage{epigraph-keys} % 名言引用
\RequirePackage{fitbox} % 图像自适应
\RequirePackage{pgfornament-han}
\RequirePackage{tikz}
\usetikzlibrary{calc,shadows,hobby,intersections, decorations.markings, decorations.pathreplacing,spy,arrows,shapes,fadings,trees,mindmap,patterns,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,graphs, quotes, angles,decorations.pathmorphing,through,shadings,backgrounds,positioning,fit,arrows.meta,shapes.misc,decorations.shapes}
\RequirePackage{pgfplots} %画图 %%页面样式设计核心包 %提供\pgfonlayer命令以及下列图层指令
\pgfplotsset{compat=1.18}
%
\ExplSyntaxOn
% 封面切换程序 (LaTeX3)!
\keys_define:nn {Beautybook/coverstyle}
  {
    cover-choose.choice:,
    cover-choose.value_required:n = true,
    cover-choose/cn.code:n = {\RequirePackage{stys/Beautybook-cover-cn}},
    cover-choose/en.code:n = {\RequirePackage{stys/Beautybook-cover-en}},
    cover-choose/enfig.code:n = {\RequirePackage{stys/Beautybook-cover-enfig}},
    cover-choose/birkar.code:n = {\RequirePackage{stys/Beautybook-cover-birkar}},
    %cover-choose .initial:n = en , % 设置 en 为初始值
  }
\newtoks \l__Beautybook_tmpa_toks
\cs_new_protected:Npn \coverstyle
  {
    \tex_afterassignment:D \__Beautybook_set_coverstyle:
    \l__Beautybook_tmpa_toks
  }
\cs_new:Npn \__Beautybook_set_coverstyle:
  { \keys_set:nV { Beautybook / coverstyle } \l__Beautybook_tmpa_toks }
% Math fonts
\keys_define:nn {Beautybook/mathstyle}
  {
    math-font.choice:,
    math-font.value_required:n = true,
    math-font/plain.code:n={},
    math-font/mtpro2.code:n = {
      \RequirePackage{mtpro2}
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
      \renewcommand{\partial}{{\text{\usefont{U}{nxlmi}{m}{it}\symbol{64}}\mspace{1mu}}}
      },
    %cover-choose .initial:n = plain , % 设置 en 为初始值
  }
\cs_new_protected:Npn \mathstyle
  {
    \tex_afterassignment:D \__Beautybook_set_mathstyle:
    \l__Beautybook_tmpa_toks
  }
\cs_new:Npn \__Beautybook_set_mathstyle:
  { \keys_set:nV { Beautybook / mathstyle } \l__Beautybook_tmpa_toks }
\ExplSyntaxOff
%
%英文字体族设定
\RequirePackage{fontspec}
\PassOptionsToPackage{quiet}{fontspec}%传递参数,以消除字体警告
\newfontfamily\Montserrat[Path=fonts/]{Montserrat-SemiBold.otf}
\newfontfamily\cabin[Path=fonts/, Extension = .otf,
UprightFont = *-Regular,
    BoldFont = *-Bold,
  ItalicFont = *-Italic,
BoldItalicFont = *-BoldItalic,]{Cabin}
\newfontfamily\sansa[Path=fonts/, Extension = .ttf,
UprightFont = *_Regular,
    BoldFont = *_Bold,
  ItalicFont = *_Italic,
BoldItalicFont = *_Bold_Italic,]{Sansation}
\newfontfamily\rodondo[Path=fonts/, BoldFont = *,]{Rodondo.otf}
%
\RequirePackage{stys/Beautybook-bottompage} %封底
\RequirePackage{rotating}
\tikzset{>=Stealth}
\setlist{nosep,font=\upshape} % 取消所有列表默认距离
% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起,
% 会将它们分在几个不同页,即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
\renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
% 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
% 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
\RequirePackage[physics]{stys/physicx}
\RequirePackage{stys/Symbols}
\RequirePackage{extarrows}
\usetikzlibrary{tikzmark}
% \arrowname{super-script}
% \arrowname[sub-script]{super-script}
\RequirePackage{appendix} % 附录
%
\RequirePackage{amssymb,amsfonts}
\RequirePackage{makeidx}
\RequirePackage{etoolbox} % 判断函数
\RequirePackage{paracol}
\RequirePackage{tikz-cd}
\RequirePackage{imakeidx}
\RequirePackage{anyfontsize}
\RequirePackage{calc}
\RequirePackage{xkeyval,ifthen}
\RequirePackage[backgroundcolor=yellow!40!cyan!20,bordercolor=yellow!40!cyan!20,linecolor=DarkCyan]{todonotes}
\RequirePackage{varwidth}
\RequirePackage[colorlinks,linkcolor = purple,		%%修改此处为你想要的颜色
anchorcolor =  purple,	%%修改此处为你想要的颜色
urlcolor = purple,		%%修改此处为你想要的颜色
citecolor = purple,		%%修改此处为你想要的颜色
]{hyperref}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}%增加编号深度
\RequirePackage{dashrule}
\newlength\outermarginwidth
\setlength\outermarginwidth{1.5cm}
\newlength\covershift
\setlength\covershift{5cm}
\RequirePackage{caption}
% 图注与表注格式
\colorlet{captioncolor}{outermarginfgcolor} % 图片和表格题注文字颜色
\makeatletter
%%----------------------------------封面信息定义--------------------------------------------------------%%
\newcommand\bookseries[1]{\def\@bookseries{#1}}
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\edition[1]{\def\@edition{#1}}
\newcommand\presslogo[1]{\def\@presslogo{#1}}
\newcommand\pressname[1]{\def\@pressname{#1}}
\newcommand\coverimage[1]{\def\@coverimage{#1}}
\newcommand\chapoddimage[1]{\def\@chapoddimage{#1}}
\newcommand\chapevenimage[1]{\def\@chapevenimage{#1}}
%%----------------------------------封面信息定义--------------------------------------------------------%%
\makeatother
\RequirePackage{indentfirst}
\RequirePackage{physics}
\definecolor{nuanbai}{HTML}{f5f5f5} % F5F5F5
\pagecolor{nuanbai}
\RequirePackage{amsmath}
\RequirePackage{zhlipsum}
\RequirePackage{fontspec}
\setmainfont{XITS}
\RequirePackage[left=2cm,right=2cm,top=.6cm,bottom=2.2cm]{geometry}
\RequirePackage{xpatch}%修正章节编号
\RequirePackage[automark]{scrlayer-scrpage}%页面设置宏包,隶属于koma-script文档类
\RequirePackage{fontawesome5}
\RequirePackage{mathrsfs}
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{breakable, skins,theorems}%TcolorBox Library
\RequirePackage{tabularx}
\RequirePackage{lastpage}
%\RequirePackage{twemojis}
\RequirePackage{ninecolors}
\RequirePackage{colortbl} %彩色表格
\RequirePackage{tabularray}
\UseTblrLibrary{amsmath}
% 定义 +array, +matrix, +bmatrix, +Bmatrix, +pmatrix, +vmatrix, +Vmatrix 和 +cases 环境。其
% 中，每一个环境都类似于不带 + 前缀的环境，但是就像 tblr 环境一样，使用 rowsep=2pt 默认值。
% 除了+array 环境外，其余的每个环境都可以带一个可选项，通过该可选项，可能为环境设置内部
% 参数。
\UseTblrLibrary{booktabs} % 定义 \toprule、 \midrule、\bottomrule 和 \cmidrule 命令，这些命令可以直接用于 tblr环境中
\UseTblrLibrary{diagbox} % 在tblr 环境中使用 \diagbox 和\diagboxthree 命令排版斜线表头
\UseTblrLibrary{varwidth} % 为表格添加 measure 内部参数。当设置了 measure=vbox 后，则会使用 \vbox 测量单元格宽度。%可以使用stretch=-1 移除列表环境上下的间距, 注意，stretch=-1 选项也会移除单元格中的支架
\RequirePackage{pgfornament}
\RequirePackage{zhnumber}
\RequirePackage{dashrule}
\RequirePackage{adjustbox}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{amsthm}
\RequirePackage{thmtools,thm-restate}%定理环境 %定理的重写
\RequirePackage{bclogo}
\RequirePackage{ulem}
\RequirePackage{pgfplots} %画图 %%页面样式设计核心包 %提供\pgfonlayer命令以及下列图层指令
\pgfplotsset{compat=1.18}
\RequirePackage{graphicx}%修正minipage顶部对齐问题
\pgfdeclarelayer{background} %背景%底层
\pgfdeclarelayer{foreground} %上层
\pgfdeclarelayer{top} %顶部
\pgfdeclarelayer{bottom} %底部
\pgfsetlayers{bottom,background,main,foreground,top}
\newcommand{\tikzoverlay}[1]{\begin{tikzpicture}[remember picture,overlay] #1 \end{tikzpicture}}
\RequirePackage[explicit]{titlesec}
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
\RequirePackage{extarrows}
\newcommand{\R}{\mathbb{R}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\lan}[1]{\langle #1 \rangle}
\newenvironment{eq}[1]{\begin{equation}\begin{aligned}#1}{\end{aligned}\end{equation}} %有编号
\newenvironment{eq*}[1]{\begin{equation*}\begin{aligned}#1}{\end{aligned}\end{equation*}} %无编号
% \everymath{\displaystyle}

\makeatletter
%% -------- 章节样式
\makeatletter
\titleformat{\chapter}{\huge\bfseries\filcenter}{}{1em}{
  \makebox[0pt][l]{\def\rad{7pt}%
  \begin{tikzpicture}[remember picture, overlay]%
      \begin{pgfonlayer}{bottom}
        \shade[left color=outermarginbgcolor!20,middle color=outermarginbgcolor!50,right color=outermarginfgcolor!20] (current page.north west) rectangle ++(\paperwidth,-.2\paperheight); % background
      \fill[outermarginfgcolor,opacity=.5]([shift={(0,-4.45cm)}]current page.north west) rectangle ++(\paperwidth,-2mm); % line
      \end{pgfonlayer}
      \path[fill=outermarginfgcolor]node[append after command={
      ([xshift=-3*\rad]chapinfoofpart.north west)  to[out=0,in=-180,looseness=1] ([xshift=\rad]chapinfoofpart.south west) --([xshift=-\rad]chapinfoofpart.south east) to[out=0,in=180,looseness=1] ([xshift=3*\rad]chapinfoofpart.north east) --cycle},
      text=white,font=\sansa\large\bfseries,align=center,minimum height=1cm] (chapinfoofpart) at ([shift={(.6\linewidth,-4.95cm)}]current page.north west) {Part\ \thepart};
      \begin{pgfonlayer}{bottom}
        \fill[outermarginfgcolor!90,opacity=0.5] ([shift={(-3*\rad,0)}]chapinfoofpart.north west) to[out=180,in=0,looseness=1] +(-4*\rad,-1.2cm)--([shift={(7*\rad,-1.2cm)}]chapinfoofpart.north east) to[out=-180,in=0,looseness=1] +(-4*\rad,1.2cm); % partnumber shade
      \end{pgfonlayer}
      \ifodd\value{page}
      \begin{pgfonlayer}{top}
        \fill[outermarginfgcolor,opacity=0.8,rounded corners=5pt]node[append after command={([yshift=2cm]chapnum.north west) rectangle (chapnum.south east)},right,text=white,minimum width=2cm,align=center,font=\Montserrat] (chapnum) at ([shift={(2cm,-2.5cm)}]current page.north west) {\scalebox{3}{\thechapter}};
        % \pattern[pattern=sixpointed stars,pattern color=outermarginfgcolor!50,opacity=0.8]
        % ([yshift=2cm]chapnum.north west) rectangle (chapnum.south east);
        \fill [outermarginfgcolor,path fading=fade up,rounded corners=5pt]%
        ([yshift=2cm]chapnum.north west) rectangle (chapnum.south east);
        \node[above left,font=\fontsize{25}{25}\selectfont\bfseries,align=center] (contents name) at ([shift={(0cm,-4.45cm)}]current page.north east) {\begin{varwidth}{.7\linewidth}\baselineskip=2ex  #1\end{varwidth}};
        \end{pgfonlayer}
        \begin{pgfonlayer}{bottom}
        \node[right] (image) at ([shift={(-0.5cm,-2.8cm)}]current page.north west) {\includegraphics[width=7cm]{\@chapoddimage}};
        \end{pgfonlayer}
        \else
        \begin{pgfonlayer}{top}
          \fill[outermarginfgcolor,opacity=0.8,rounded corners=5pt]node[append after command={([yshift=2cm]chapnum.north west) rectangle (chapnum.south east)},left,text=white,minimum width=2cm,align=center,font=\Montserrat] (chapnum) at ([shift={(-2.0cm,-2.5cm)}]current page.north east) {\scalebox{3}{\thechapter}};
          % \pattern[pattern=sixpointed stars,pattern color=outermarginfgcolor!50,opacity=0.8]
          % ([yshift=2cm]chapnum.north west) rectangle (chapnum.south east);
          \fill [outermarginfgcolor,path fading=fade up,rounded corners=5pt]%
          ([yshift=2cm]chapnum.north west) rectangle (chapnum.south east);
          \node[above right,font=\fontsize{25}{25}\selectfont\bfseries,align=center] (contents name) at ([shift={(0cm,-4.45cm)}]current page.north west) {\begin{varwidth}{.7\linewidth}\baselineskip=2ex  #1\end{varwidth}};
          \end{pgfonlayer}
      \begin{pgfonlayer}{background}
      \node[left] (image) at ([shift={(0.5cm,-2.8cm)}]current page.north east) {\includegraphics[width=7cm]{\@chapevenimage}};
      \end{pgfonlayer}
        \fi
        \path[fill=outermarginfgcolor]node[append after command={
        ([xshift=-2*\rad]pagenumber.south west)  to[out=0,in=180,looseness=1] ([xshift=\rad]pagenumber.north west) --([xshift=-\rad]pagenumber.north east) to[out=0,in=-180,looseness=1] ([xshift=2*\rad]pagenumber.south east) --cycle},
        text=white,font=\rodondo\fontsize{15}{15}\selectfont\bfseries,align=center,minimum height=0.4cm,minimum width=1.3cm,inner sep=1.5mm] (pagenumber) at ([shift={(0,0.3cm)}]current page.south) {\thepage};
        \fill[outermarginfgcolor,rounded corners=1pt]
        (current page.south west) -- ++(1.5mm,1.5mm) --++(.44\paperwidth,0)--++(1.5mm,-1.5mm)--cycle;
        \fill[outermarginfgcolor,rounded corners=1pt]
        (current page.south east) -- ++(-1.5mm,1.5mm) --++(-.44\paperwidth,0)--++(-1.5mm,-1.5mm)--cycle;
        \end{tikzpicture}}
    }
\titleformat{name=\chapter,numberless}{\bfseries\huge\filcenter}{}{1em}{
  \makebox[0pt][l]{\def\rad{7pt}%
  \begin{tikzpicture}[remember picture, overlay]%
      \begin{pgfonlayer}{bottom}
        \shade[left color=outermarginbgcolor!20,middle color=outermarginbgcolor!50,right color=outermarginfgcolor!20] (current page.north west) rectangle ++(\paperwidth,-.2\paperheight); % background
      \fill[outermarginfgcolor,opacity=.5]([shift={(0,-4.45cm)}]current page.north west) rectangle ++(\paperwidth,-2mm); % line
      \end{pgfonlayer}
      \ifodd\value{page}
      \begin{pgfonlayer}{top}
        \node[above left,font=\fontsize{25}{25}\selectfont\bfseries,align=center] (contents name) at ([shift={(0cm,-4.45cm)}]current page.north east) {\begin{varwidth}{.7\linewidth}\baselineskip=2ex  #1\end{varwidth}};
        \end{pgfonlayer}
        \begin{pgfonlayer}{bottom}
        \node[right] (image) at ([shift={(-0.5cm,-2.8cm)}]current page.north west) {\includegraphics[width=7cm]{\@chapoddimage}};
        \end{pgfonlayer}
        \else
        \begin{pgfonlayer}{top}
          \node[above right,font=\fontsize{25}{25}\selectfont\bfseries,align=center] (contents name) at ([shift={(0cm,-4.45cm)}]current page.north west) {\begin{varwidth}{.7\linewidth}\baselineskip=2ex  #1\end{varwidth}};
          \end{pgfonlayer}
      \begin{pgfonlayer}{background}
      \node[left] (image) at ([shift={(0.5cm,-2.8cm)}]current page.north east) {\includegraphics[width=7cm]{\@chapevenimage}};
      \end{pgfonlayer}
        \fi
        \path[fill=outermarginfgcolor]node[append after command={
          ([xshift=-2*\rad]pagenumber.south west)  to[out=0,in=180,looseness=1] ([xshift=\rad]pagenumber.north west) --([xshift=-\rad]pagenumber.north east) to[out=0,in=-180,looseness=1] ([xshift=2*\rad]pagenumber.south east) --cycle},
          text=white,font=\rodondo\fontsize{15}{15}\selectfont\bfseries,align=center,minimum height=0.4cm,minimum width=1.3cm,inner sep=1.5mm] (pagenumber) at ([shift={(0,0.3cm)}]current page.south) {\thepage};
          \fill[outermarginfgcolor,rounded corners=1pt]
          (current page.south west) -- ++(1.5mm,1.5mm) --++(.44\paperwidth,0)--++(1.5mm,-1.5mm)--cycle;
          \fill[outermarginfgcolor,rounded corners=1pt]
          (current page.south east) -- ++(-1.5mm,1.5mm) --++(-.44\paperwidth,0)--++(-1.5mm,-1.5mm)--cycle;
        \end{tikzpicture}}
}
\titlespacing{\chapter}{0pt}{0pt}{65pt}
\makeatother
% -------- Part定制
\makeatletter
\newcommand\partabstract[1]{\def\@partabstract{#1}}
\newcommand\partimage[1]{\def\@partimage{#1}}
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
        \node[above,font=\sansa\huge,shift={(.33\linewidth,.5\barwidth)}] (partname) at (hbar) {Part\ \thepart};
        \node[below,left,font=\sffamily\bfseries\huge,shift={(.146\linewidth,-1.5*\barwidth)}] (partcontents) at (partname) {\begin{varwidth}{.8\linewidth}\raggedright\baselineskip=2ex  #1 \end{varwidth}}; % 标题名称
          \begin{pgfonlayer}{background}
            \node[above,shift={(-.4\linewidth,-4*\barwidth)},opacity=0.8] at (partname) {\ifdefvoid{\@partimage}{}{\includegraphics[width=1.2\linewidth]{\@partimage}}}; % 图片位置调整
            \end{pgfonlayer}
            \node[above right,font=\rodondo\fontsize{15}{15}\selectfont,circle,fill=outermarginfgcolor,text=white,inner sep=1mm] (pagenumber) at ([shift={(5mm,5mm)}]current page.south west) {\thepage};
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
            \node[above,font=\sansa\huge,shift={(-.31\linewidth,.5\barwidth)}] (partname) at (hbar) {Part\ \thepart};
            \node[below right,font=\sffamily\bfseries\huge,shift={(-.125\linewidth,-1.2*\barwidth)}] (partcontents) at (partname) {\begin{varwidth}{.8\linewidth}\raggedright\baselineskip=2ex  #1 \end{varwidth}}; % 标题名称
            \begin{pgfonlayer}{background}
                \node[above,shift={(.4\linewidth,-4*\barwidth)},opacity=0.8] at (partname) {\ifdefvoid{\@partimage}{}{\includegraphics[width=1.2\linewidth]{\@partimage}}}; % 图片位置调整
                \end{pgfonlayer}
                \node[above left,font=\rodondo\fontsize{15}{15}\selectfont,circle,fill=outermarginfgcolor,text=white,inner sep=1mm] (pagenumber) at ([shift={(-5mm,5mm)}]current page.south east) {\thepage};
        \fi
        \node[below,,font=\sffamily\fontsize{13}{13}\selectfont,shift={(0\linewidth,-1.65*\barwidth)}] at (hbar) {\ifdefvoid{\@partabstract}{}{\begin{varwidth}{.85\linewidth}\baselineskip=3ex \@partabstract\end{varwidth}}}; % 简介文字调整
    \end{tikzpicture}}
\makeatother
\assignpagestyle{\part}{empty}
\assignpagestyle{\chapter}{empty}
%% -- Section
\titleformat{\section}
{}
{}
{-.5em} %左右移动\thesection标签位置
{\mysectionformat{#1}}

\newcommand{\mysectionformat}[1]{%
\makebox[0pt][l]{\def\rad{7pt}%
\begin{tikzpicture}[remember picture]
    \path[fill=outermarginfgcolor,drop shadow={opacity=0.3,shadow xshift=.05cm,shadow yshift=-.05cm}]node[append after command={
    ([xshift=\rad]sec.north west) to[out=180,in=0,looseness=1] ([xshift=-3*\rad]sec.south west) --([xshift=-\rad]sec.south east) to[out=0,in=180,looseness=1] ([xshift=3*\rad]sec.north east) --cycle},
    text=white,font=\rmfamily\large\bfseries,align=center,inner ysep=2mm] (sec) at (0,0) {Sec\ \thesection};
    \draw[outermarginbgcolor,line width=0.5pt] (sec.north east)--++(.8\linewidth,0);
    \node[text=black,font=\rmfamily\bfseries\Large,below right] (secnum) at ([shift={(0,0mm)}]sec.north east) {\begin{varwidth}{.85\linewidth}\setlength\baselineskip{22.5pt}\hspace{.5cm}#1\end{varwidth}};
\end{tikzpicture}}}%最后一个选项为 [<after code>]
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
% 侧边条
\newlength\chapternumbersize
\setlength\chapternumbersize{40pt}
\setlength{\headheight}{40pt} % 页眉高度
\RequirePackage{xpatch}
\RequirePackage{scrlayer-scrpage}
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
    \fill[headlinecolor,rounded corners=1pt] ([shift={(0.2\outermarginwidth,0.2cm)}]anchor of headmark) --++(-5pt,-0.15cm)--++(-.45\linewidth,0) --++(-5pt,0.15cm)--cycle; % 页眉横线
    \node[below left,font=\upshape,text=outermarginfgcolor] at (anchor of headmark) {\begin{varwidth}{\linewidth}\rightmark\end{varwidth}};
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.south east) --++(-5pt,0.15cm)--++(-\outermarginwidth+10pt,0) --++(-5pt,-0.15cm)--cycle; % 页码横线
    \coordinate (anchor-of-footmark) at ([shift={(-\outermarginwidth,0.2cm)}]current page.south east);
    \fill[headlinecolor,rounded corners=1pt] ([yshift=-0.2cm]anchor-of-footmark) --++(-5pt,0.15cm)--++(-.45\linewidth,0) --++(-5pt,-0.15cm)--cycle; % 页脚横线
    \else
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.north west) --++(5pt,-0.15cm)--++(\outermarginwidth-10pt,0) --++(5pt,0.15cm)--cycle;
    \coordinate (anchor of headmark) at ([shift={(1.2\outermarginwidth,-0.2cm)}]current page.north west);
    \node[below ,text=outermarginfgcolor,font=\rodondo\bfseries\fontsize{20}{20}\selectfont] at ([shift={(.5\outermarginwidth,-0.2cm)}]current page.north west) {\thepage};
    \fill[headlinecolor,rounded corners=1pt] ([shift={(-0.2\outermarginwidth,0.2cm)}]anchor of headmark) --++(5pt,-0.15cm)--++(.45\linewidth,0) --++(5pt,0.15cm)--cycle; % 页眉横线
    \node[below right,font=\upshape,text=outermarginfgcolor] at (anchor of headmark) {\begin{varwidth}{\linewidth}\rightmark\end{varwidth}};
    \fill[outermarginfgcolor,rounded corners=2pt] (current page.south west) --++(5pt,0.15cm)--++(\outermarginwidth-10pt,0) --++(5pt,-0.15cm)--cycle; % 页码横线
    \coordinate (anchor-of-footmark) at ([shift={(\outermarginwidth,0.2cm)}]current page.south west);
    \fill[headlinecolor,rounded corners=1pt] ([yshift=-0.2cm]anchor-of-footmark) --++(5pt,0.15cm)--++(.45\linewidth,0) --++(5pt,-0.15cm)--cycle; % 页脚横线
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
% % set the contents of the outer margin on even and odd pages for scrheadings, plain and scth
% \oddoutermargin{\cabin\leftmark} % Odd 奇数页
% \makeatletter
% \evenoutermargin{\cabin\@title} % Even 偶数页
% \makeatother
%% Begin The Most Beautiful Box (STYLE : ys style) % 中国风盒子
\makeatletter
\definecolor{framegolden}{HTML}{455a64} % 控制外框颜色
\definecolor{framegray}{HTML}{e0e0e0} % 控制填充颜色
\newdimen\ys@frame@linewidth
\newdimen\ys@frame@radius
\newdimen\ys@frame@sep
\def\ys@frame@fill@opacity{0.2}

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
\def\ys@frame@remove@middleline#1#2{}
\def\ys@frame@draw@middleline#1#2{%
  \clip ([xshift=-\ys@frame@linewidth,#1]frame.north west)--
        ([xshift=\ys@frame@linewidth,#1]frame.north east)--
        ([xshift=\ys@frame@linewidth,#2]frame.south east)--
        ([xshift=-\ys@frame@linewidth,#2]frame.south west)--cycle;}
\def\ys@frame@unbrokenouter{%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    ([xshift=\ys@frame@radius]frame.north west)--([xshift=-\ys@frame@radius]frame.north east)
    arc(-180:-90:\ys@frame@radius)--
    ([yshift=-\ys@frame@radius]frame.north east)--([yshift=\ys@frame@radius]frame.south east)
    arc(90:180:\ys@frame@radius)--
    ([xshift=-\ys@frame@radius]frame.south east)--([xshift=\ys@frame@radius]frame.south west)
    arc(0:90:\ys@frame@radius)--
    ([yshift=\ys@frame@radius]frame.south west)--([yshift=-\ys@frame@radius]frame.north west)
    arc(-90:0:\ys@frame@radius)--cycle;}
\def\ys@frame@firstouter{%
  \ys@frame@remove@middleline{yshift=.5\ys@frame@linewidth}{yshift=.7\ys@frame@linewidth}%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    ([xshift=\ys@frame@radius]frame.north west)--([xshift=-\ys@frame@radius]frame.north east)
    arc(-180:-90:\ys@frame@radius)--
    ([yshift=-\ys@frame@radius]frame.north east)--
    (frame.south east)--
    (frame.south west)--
    ([yshift=-\ys@frame@radius]frame.north west)
    arc(-90:0:\ys@frame@radius)--cycle;}
\def\ys@frame@middleouter{%
  \ys@frame@remove@middleline{yshift=-.7\ys@frame@linewidth}{yshift=.7\ys@frame@linewidth}%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    (frame.north west)--(frame.north east)--(frame.south east)--
    (frame.south west)--cycle;}
\def\ys@frame@lastouter{%
  \ys@frame@remove@middleline{yshift=-.7\ys@frame@linewidth}{yshift=-.5\ys@frame@linewidth}%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
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
  % 控制是否在断点处的线不画出来
  ys/frame/not at break/.code=\let\ys@frame@remove@middleline\ys@frame@draw@middleline,
  ys/frame/fill opacity/.store in=\ys@frame@fill@opacity,
  ys/frame/draw at break/.code=\let\ys@frame@remove@middleline\@gobbletwo,
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
      \foreach \ii/\jj/\kk in \ys@frame@star@list {\ys@frame@star{\ii}{\jj}{\kk}} % 星
      \ys@frame@unbrokeninner % 内线
      \ys@frame@unbrokencorner % 四角
    },
    interior titled code={%
      \ys@frame@unbrokenouter % 外框
      \foreach \ii/\jj/\kk in \ys@frame@star@list {\ys@frame@star{\ii}{\jj}{\kk}} % 星
      \ys@frame@unbrokeninner % 内线
      \ys@frame@unbrokencorner % 四角
    }
  },
  ys/frame/first/.style={
    interior code={%
      \ys@frame@firstouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@t {\ys@frame@star{\ii}{\jj}{\kk}}
      \ys@frame@firstinner
      \ys@frame@firstcorner},
    interior titled code={%
      \ys@frame@firstouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@t {\ys@frame@star{\ii}{\jj}{\kk}}
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
      \foreach \ii/\jj/\kk in \ys@frame@star@list@b {\ys@frame@star{\ii}{\jj}{\kk}}
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
\newtcolorbox{fancybox}{enhanced,ys style,breakable,pad at break=2mm,
  ys/frame/not at break,ys/frame/fill opacity=0}
%% End The Most Beautiful Box
\makeatletter
\definecolor{CyaN}{HTML}{dbe1e5}
\colorlet{OrangE}{yellow!20!orange}
\colorlet{BluE}{cyan!70!blue}
\colorlet{ReD}{red!20!orange}
\colorlet{GreeN}{yellow!40!green}

% 第一种定理
\tcbset{my@basic@thm/.style={enhanced jigsaw, breakable,
  enlarge left by=-3.5mm, width=\textwidth+3.5mm, boxrule=0pt,
  top=2pt, bottom=2pt, left=2.5mm, frame hidden}}
\newcommand{\@my@newtheorem@n}[1]{\ERROR}
\newcommand{\@my@newtheorem@nn}[2]{%
  \@ifundefined{#1}{\@my@newtheorem{#1}#2}{\@my@renewtheorem{#1}#2}}
\NewDocumentCommand{\@my@newtheorem}{ m m o +m }
  {\IfNoValueTF{#3}{\newtheorem{#1}{#2}}{\newtheorem{#1}{#2}[#3]}%
    \tcbset{my@#1@thmstyle/.style={#4}}%
    \tcolorboxenvironment{#1}{my@basic@thm, my@#1@thmstyle}}
\NewDocumentCommand{\@my@renewtheorem}{ m m o +m }
  {\IfNoValueTF{#3}{\renewtheorem{#1}{#2}}{\renewtheorem{#1}{#2}[#3]}%
    \tcbset{my@#1@thmstyle/.style={#4}}}
%
% ---------------------------------------------------------------------------------- %
% 第二种定理
\tcbset{my@basic@tcbthm/.style={detach title,}}
\newcommand{\@my@newtcbtheorem@n}[1]{\ERROR}
\newcommand{\@my@newtcbtheorem@nn}[2]{%
  \@ifundefined{#1}{\@my@newtcbtheorem{#1}{#2}}{\@my@renewtcbtheorem{#1}{#2}}}
\newcommand{\@my@newtcbtheorem}[2]{%
  \edef\my@curr@thmenvname{#1}% 它保存当前定理环境的名称
  \mytcbtheoremset{#2}%
  \NewTColorBox{#1}{ O{} O{} o }
    {my@basic@tcbthm, my@#1@tcbthmstyle, title={##2}, IfNoValueF={##3}{label={##3}}, ##1}}
\newcommand{\@my@renewtcbtheorem}[2]{\edef\my@curr@thmenvname{#1}\mytcbtheoremset{#2}}

% 键值设置
\pgfkeys{/mytcbtheorem/.is family}
\newcommand{\mytcbtheoremset}{\pgfqkeys{/mytcbtheorem}}
\mytcbtheoremset{
  name/.code=\@namedef{\my@curr@thmenvname @name}{#1}, %无效
  counter/.code=\@namedef{my@\my@curr@thmenvname @counter}{#1}\newcounter{#1}[chapter], % 计数器遇到subsection就会自动归零 % https://zhuanlan.zhihu.com/p/57454848#circle=on
  the counter/.code=\@namedef{the\@nameuse{my@\my@curr@thmenvname @counter}}{#1},
  autoref name/.code=\@namedef{\@nameuse{my@\my@curr@thmenvname @counter}autorefname}{#1},
  style/.code=\tcbset{my@\my@curr@thmenvname @tcbthmstyle/.style={#1}},
  thmcolor/.code=\@namedef{\my@curr@thmenvname @thmcolor}{#1}, %无效
  lemcolor/.code=\@namedef{\my@curr@thmenvname @lemcolor}{#1}, %无效
}
% 存储键值 (LaTeX3)
\ExplSyntaxOn
\cs_new_protected:Npn \mynewtheorem
  { \keyval_parse:NNn \@my@newtheorem@n \@my@newtheorem@nn }
\cs_new_protected:Npn \mynewtcbtheorem
  { \keyval_parse:NNn \@my@newtcbtheorem@n \@my@newtcbtheorem@nn }
\ExplSyntaxOff
\makeatother

% 第二种定理
\makeatletter
%%  Overlay Settings
\newcommand{\my@theorem@overlay@unbroken}[2]{
      %%============== First ==============%%
  \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
  \node[rectangle, text=white, drop shadow={opacity=.3, shadow xshift=0.1cm}, inner sep=1.5mm,fill=#2,
anchor=west,rounded corners=3pt,font=\bfseries\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west) {\hspace*{1.5em}#1.\ \ifdefvoid{\tcbtitletext}{}{(\tcbtitletext)}};
  \fill[color=#2,drop shadow={opacity=0.3,shadow xshift=.3pt}]
      ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
      \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
      %%============== End ==============%%
  \fill[#2,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}]
  ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
  \fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
  \fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
}
\newcommand{\my@theorem@overlay@first}[2]{
  \fill[black!60] ([xshift=1cm,yshift=5pt]frame.north west)-- ([xshift=0.8cm,yshift=0cm]frame.north west)--([xshift=1.2cm,yshift=0cm]frame.north west)--cycle;
  \node[rectangle, text=white, drop shadow={opacity=.3, shadow xshift=0.1cm}, inner sep=1.5mm,fill=#2, anchor=west,rounded corners=3pt,font=\bfseries\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west) {\hspace*{1.5em}#1.\ \ifdefvoid{\tcbtitletext}{}{(\tcbtitletext)}};
  \fill[color=#2,drop shadow={opacity=0.3,shadow xshift=.3pt}]
        ([xshift=1cm,yshift=5pt]frame.north west) {[rounded corners=3pt]--++(-1cm-5pt,0)}--++(0,-1cm-5pt)--cycle;
  \fill[color=black!60] ([xshift=-5pt,yshift=-1cm]frame.north west)--([xshift=0cm,yshift=-0.8cm]frame.north west)-- ([xshift=0cm,yshift=-1.2cm]frame.north west)--cycle;
}
\newcommand{\my@theorem@overlay@last}[1]{
  \fill[#1,drop shadow={opacity=0.3,shadow xshift=-0.008\linewidth,shadow yshift=0.0016\linewidth}]
  ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) {[rounded corners=3pt]--++(0.05\linewidth+5pt,0)}--++(0,0.05\linewidth+5pt)--cycle;
  \fill[black!60] ([xshift=-0.05\linewidth,yshift=-5pt]frame.south east) -- ([xshift=-0.04\linewidth,yshift=0pt]frame.south east)-- ([xshift=-0.06\linewidth,yshift=0pt]frame.south east)--cycle;
  \fill[black!60] ([xshift=5pt,yshift=0.05\linewidth]frame.south east)-- ([yshift=0.04\linewidth]frame.south east) -- ([yshift=0.06\linewidth]frame.south east)--cycle;
}
% Second theorem style overlay settings
\newcommand{\my@lemma@overlay@unbroken}[2]{
    %%============== First ==============%%
    \def\Rad{3.5pt}
    \def\theight{0.57cm}
    \def\rad{7pt}%
    \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=.05cm,shadow yshift=-.05cm}]node[append after command={
    ([xshift=-1.5*\rad]thmname.north west) to[out=0,in=180,looseness=1] ([xshift=2.5*\rad]thmname.south west) --([xshift=-\rad]thmname.south east) to[out=0,in=180,looseness=1] ([xshift=3*\rad]thmname.north east) --cycle},
    text=white,font=\bfseries,align=center,inner ysep=1.5mm,minimum height=0.6cm,right] (thmname) at ([xshift=\rad,yshift=-\rad]frame.north west) {\hspace*{10pt}#1.\ \ifdefvoid{\tcbtitletext}{}{(\tcbtitletext)}};
    \begin{pgfonlayer}{bottom}
      \fill[#2,opacity=0.5]
      ([xshift=-1.5*\rad]thmname.north west) to[out=-90,in=0,looseness=1.5] +(3pt,-6pt) -| +(10pt,0)--cycle;
      \fill[#2,opacity=0.5]
      ([xshift=3*\rad]thmname.north east) to[out=0,in=-90] +(5pt,-5pt) -| ++(-10pt,0) --cycle;
    \end{pgfonlayer}
    %%============== End ==============%%
    \def\tlen{1.5cm}
    \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=-2*\rad,yshift=-5pt]frame.south east) coordinate (SE)  to[out=0,in=180] +(4*\rad,5pt+\theight) --([shift={(-\tlen+4*\rad,5pt+\theight)}]SE) to[out=180,in=0] +(-4*\rad,-5pt-\theight) --cycle;
    \begin{pgfonlayer}{bottom}
      \fill[color=#2!80!black] ([xshift=-1.35*\tlen+\Rad,yshift=-5pt]frame.south east) to[out=180,in=90,looseness=0.7] ([xshift=-1.35*\tlen-0.5*\Rad]frame.south east) coordinate (NWl)--([xshift=2*\rad]NWl) to[out=-90,in=-180,looseness=0.7] ([xshift=-1.35*\tlen+\Rad,yshift=-5pt]frame.south east)--cycle;
    \end{pgfonlayer}
	}
\newcommand{\my@lemma@overlay@first}[2]{
    %%============== First ==============%%
    \def\Rad{3.5pt}
    \def\theight{0.57cm}
    \def\rad{7pt}%
    \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=.05cm,shadow yshift=-.05cm}]node[append after command={
    ([xshift=-1.5*\rad]thmname.north west) to[out=0,in=180,looseness=1] ([xshift=2.5*\rad]thmname.south west) --([xshift=-\rad]thmname.south east) to[out=0,in=180,looseness=1] ([xshift=3*\rad]thmname.north east) --cycle},
    text=white,font=\bfseries,align=center,inner ysep=1.5mm,minimum height=0.6cm,right] (thmname) at ([xshift=\rad,yshift=-\rad]frame.north west) {\hspace*{10pt}#1.\ \ifdefvoid{\tcbtitletext}{}{(\tcbtitletext)}};
    \begin{pgfonlayer}{bottom}
      \fill[#2,opacity=0.5]
      ([xshift=-1.5*\rad]thmname.north west) to[out=-90,in=0,looseness=1.5] +(3pt,-6pt) -| +(10pt,0)--cycle;
      \fill[#2,opacity=0.5]
      ([xshift=3*\rad]thmname.north east) to[out=0,in=-90] +(5pt,-5pt) -| ++(-10pt,0) --cycle;
    \end{pgfonlayer}
  }
\newcommand{\my@lemma@overlay@last}[1]{
    %%============== End ==============%%
    \def\Rad{3.5pt}
    \def\rad{7pt}%
    \def\theight{0.57cm}
    \def\tlen{1.5cm}
    \path[fill=#1,drop shadow={opacity=0.3,shadow xshift=.3pt}]
    ([xshift=-2*\rad,yshift=-5pt]frame.south east) coordinate (SE)  to[out=0,in=180] +(4*\rad,5pt+\theight) --([shift={(-\tlen+4*\rad,5pt+\theight)}]SE) to[out=180,in=0] +(-4*\rad,-5pt-\theight) --cycle;
    \begin{pgfonlayer}{bottom}
      \fill[color=#1!80!black] ([xshift=-1.35*\tlen+\Rad,yshift=-5pt]frame.south east) to[out=180,in=90,looseness=0.7] ([xshift=-1.35*\tlen-0.5*\Rad]frame.south east) coordinate (NWl)--([xshift=2*\rad]NWl) to[out=-90,in=-180,looseness=0.7] ([xshift=-1.35*\tlen+\Rad,yshift=-5pt]frame.south east)--cycle;
    \end{pgfonlayer}
	}
\makeatother
%%

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
\declaretheorem[style=Proofstyle,numbered=no,name={\sansa Proof}]{Proof}
\renewenvironment{proof}{\begin{Proof} }{\end{Proof}}
\declaretheorem[style=Proofstyle,numbered=no,name={\sansa Solution}]{solution}
%% --------参考文献
\RequirePackage[
backend=biber,
style=gb7714-2015,
sorting=nty
]{biblatex}
\addbibresource{ref.bib}
\indexsetup{level=\chapter*,noclearpage}
\makeindex[title={\sansa References},columns=3,columnsep=15pt,columnseprule]
\makeindex
\newcommand{\Diff}[2][]{\frac{\partial #1}{\partial #2}}
\newcommand{\Dif}[2]{\frac{\dd #1}{\dd #2}}
%%%%%%%%%%%%%%% 计数器知识 %%%%%%%%%%%%%%%%%%%%%%
% 每次用 \newcounter{foo} 定义新计数器，内部都会定义这几个命令

% \c@foo，储存计数器的值，初始值为 0
% \thefoo，储存计数器输出时的格式，初始定义为 \arabic{foo}
% \p@foo，储存计数器被引用时的前缀，初始定义为空
% \cl@foo，储存「子计数器」列表（此处有简化），foo 自增时它的每个「子计数器」都会归零（详见「自动归零」一节），初始定义为空
%% 关于计数器的自动归零
% 如果还定义了计数器 \newcounter{bar}[foo]，那么 \cl@foo 里就有了 bar
% \@addtoreset{child}{parent} 和 \@removefromreset{child}{parent} 可以把计数器 child 移入/移出 \cl@parent
% \counterwithin* 和 \counterwithout* 和上一条里两个命令的功能类似，但它们在执行前会检查接受的两个参数是否为已定义的计数器。不加星号的版本会修改 \thechild，详见「输出格式」一节
% 在使用 \stepcounter{parent} 和 \refstepcounter{parent} 时，parent 自增，同时归零\cl@parent 里的「子计数器」
% \addtocount{parent}{1} 只自增 parent，没有归零其「子计数器」的效果
% 归零实现为「对每个子计数器，先设为 -1，然后使用 \stepcounter 自增」，这样实现的「归零」功能是递归的
% 递归的意思是，如果还有 \newcounter{grandchild}[child]，那么 \stepcounter{parent} 会将 child 和 grandchild 都归零
