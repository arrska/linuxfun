#!/bin/bash
#filter that converts result of  max-temp.sh into tab separated values
#example:
#input: ../lost24/monitor/2012.04.25/10:50/hp-temps.txt 54 °C
#output: 2012.04.25 10:50 54

#rev | cut -d/ -f1,2,3 | rev | cut -d" " -f1,2 | sed -e 's/\// /g' | sed -e 's/ hp-temps.txt /\t/g'


 str=$(rev | cut -d/ -f1,2,3 | rev | sed -e 's/hp-temps.txt //g')
 date=$(echo $str | cut -d/ -f1)
 time=$(echo $str | cut -d/ -f2)
 temp=$(echo $str | cut -d/ -f3 | cut -d' ' -f1)

echo $date $time"	"$temp
