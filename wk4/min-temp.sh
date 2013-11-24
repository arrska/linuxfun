#!/bin/bash
# finds the date of coldest measured PROCESSOR_ZONE temperature from any direcorty of lost24 dataset

t=99
coldday=0

for dir in $@
do
	for file in $(find $dir -name hp-temps.txt)
	do
		daytemp=$(grep -h PROCESSOR_ZONE $file | sed -e 's/\(\/\)\|\(\ \)\+/,/g' | cut --delimiter="," --field=3 | sed -e 's/C//g')
		if [ $daytemp -lt $t ]; then
			t=$daytemp
			coldday=$file
		fi
	done
done


echo $coldday $t $'\xc2\xb0'C