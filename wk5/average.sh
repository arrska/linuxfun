#!/bin/bash
#calculates average of arguments

sum=0
for num in $@
do
	sum=$sum+$num
done
echo "scale=2; ($sum)/$#" | bc