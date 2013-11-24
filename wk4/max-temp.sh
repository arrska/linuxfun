#!/bin/bash
# finds the date of hottest measured PROCESSOR_ZONE temperature from any direcorty of lost24 dataset

t=0
hotday=0

for dir in $@
do
	for file in $(find $dir -name hp-temps.txt)
	do
		daytemp=$(grep -h PROCESSOR_ZONE $file | sed -e 's/\(\/\)\|\(\ \)\+/,/g' | cut --delimiter="," --field=3 | sed -e 's/C//g')
		if [ $daytemp -gt $t ]; then
			t=$daytemp
			hotday=$file
		fi
	done
done


echo $hotday $t $'\xc2\xb0'C