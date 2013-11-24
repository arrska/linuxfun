#!/bin/bash
#takes one numerical parameter and prints a longcat as long as that parameter

upperbody=$(head -n 10 shortcat.txt)
lowerbody=$(tail -n 8 shortcat.txt)
stomach=$(head -n 11 shortcat.txt | tail -n 1)

if [ $1 -eq $1 2>/dev/null ]
then
	if [ $1 -eq 1 ]
	then
		cat shortcat.txt
		echo ""
		exit 0
	fi

	echo "$upperbody"

	n=0
	while [ $n -lt $1 ]
	do
		echo "$stomach"
		n=$(expr $n + 1)
	done

	echo "$lowerbody" | sed -e 's/Short/ Long/g'
	exit 0
fi

echo "error:
$0 takes only one parameter that must be a number greater than 1"
exit 1