set title ""
#set grid

#下面这一行是用来描述图的每根线代表的意义的那个框框的属性。在本例中就是“Throutput-WorkLoad”　
#其中right top表示位置显示。　Left 表示框子里的字左对齐。　width X用来限定框子大小。
#box X用来表示选用哪种类型的框子--颜色可能不同。 这里在png图里，如果width是0的画，会显得box很
#大，但是，没有关系，如果把它改成jpg格式的话，box正好合适。
#set key right top Left reverse width 0 box 3

#下面这两行用来表示x,y轴的意思。引号内的内容会显示在图的轴旁边。
#其中，右边的两个数字表示引号内的内容在图中与x,y轴之间的相对距离。
#第一个0代表水平方向。第二个代表垂直方向。
set xlabel "变更版本"  font "simsun,11"
set ylabel "相似度"  font "simsun,11"

#下面这一行非常重要。它表示你的x或者y轴的显示范围。
#有的时候图形并不一定要从0开始显示。就可以在这里设置。比如这里的y轴零点就是80.
set yrange [0:1]

#下面两行是用来标注x,y轴的标度。引号内的内容是显示时的标度。没有打引号的是真实的度量。
set xtics ("0" 0,"1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9,"10" 10, "11" 11, "12" 12) font "Time-Roman,11"
set ytics ("0" 0, "0.2" 0.2,"0.4" 0.4,"0.6" 0.6,"0.8" 0.8,"1" 1) font "Time-Roman,11"

#下面这一行是用来限制图的大小。但是不包括前面第二行中讲的那个box。
#"0.7"表示横向的相对大小　"0.6"表示纵向的相对大小。
set size 1,1
#set terminal windows

set term post eps color solid enh  
#这里就是用来指定画图的数据来自"t_w_1_date.txt"文件。这个文件很好写。只需要把你要画的数据写成两列。
#左边一列是x周的数据,右边一列是y轴的数据。　tittle表示你这根线要用什么标示。它会显示在前面第二行所
#述的那个box里面。with指定线的类型。这里也可以同时制定画多条线对比。例如：
#plot "t_w_1_date.txt" title "Throughput-Workload" with linespoints,"t_w_2_date.txt" title
#"Throughput-Workload2" with linespoints, ...
plot "con.data" title "" with linespoints

#下面两行用来标示输出的图片的类型。好像不支持jpg。但是你可以直接把文件改名为jpg.
#set terminal png 
#set output "contribution.png"
#set term postscript
#set output 'a.eps'
#set terminal epslatex colour colourtext
#set output "xxx.tex"
set terminal latex
set output "a.tex"
replot
