#!/bin/bash
gnuplot << EOF

# Args:
# $1: 100cloudlets.txt
# $2: 200cloudlets.txt
# $3: 500cloudlets.txt

set term postscript eps color 40
set size 2.10,1.6
set output "currentcost.eps"
set datafile separator "\t"


set xdata time
set timefmt "%H:%M:%S"
# time range must be in same format as data file
#set xrange ["Mar-25-00:00:00":"Mar-26-00:00:00"]
#set yrange [0:50]
set grid
set xlabel "Time"
set ylabel "Load"
set title "Load Averages"
set key left box
plot $1 using 3:8 index 0 title "ahost" with lines

set style line 1 lt rgb "green" lw 15 pt 9 ps 3
set style line 2 lt rgb "red" lw 20 pt 7 ps 3
set style line 3 lt rgb "blue" lw 30 pt 5 ps 3
set style line 4 lt rgb "black" lw 10 pt 4 ps 3
set style line 5 lt rgb "yellow" lw 25 pt 3 ps 3

set title ""
set key left
set ylabel "Time (ms)"
set xlabel "# Requests (thousands)"
set grid
set yr [0:2200]
set ytic 200

plot "$1" using 1:2  title 'Average' ls 1 with linespoints, \
 "$1" using 1:3  title 'Median' ls 2 with linespoints, \
 "$1" using 1:4  title '90% Line' ls 4 w linespoints, \
 "$1" using 1:5  title 'Throughput' ls 3 w linespoints

EOF
