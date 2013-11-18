#!/bin/bash
#converts folder of jpegs to hipster-jpegs

for inputfile in $1/*.jpg
do
	prefix=${inputfile%.jpg}
	outputfile=$prefix-hipstah.jpg
	convert -sepia-tone 60% +polaroid $inputfile $outputfile
done
