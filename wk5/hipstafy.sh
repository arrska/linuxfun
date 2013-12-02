#!/bin/bash
#converts file to hipstahfile

inputfile=$1
directory=$(dirname "$inputfile")
base=$(basename "$inputfile")

prefix=${base%.jpg}
outputfile=$prefix-hipstah.jpg
convert -sepia-tone 60% +polaroid "$inputfile" "$directory/hipstafied/$outputfile"