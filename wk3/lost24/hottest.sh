#!/bin/bash
# finds the date of hottest measured PROCESSOR_ZONE temperature from Nov 2011 of lost24 dataset

t=0
hotday=0
for daydir in monitor/2011.11.*
do
	for file in $daydir/*/hp-temps.txt
	do
		daytemp=$(grep -h PROCESSOR_ZONE $file | cut -c31-33)
		#daytemp=$(grep -h PROCESSOR_ZONE $file | sed -e 's/\(\/\)\|\(\ \)\+/,/g' | cut --delimiter="," --field=3 | sed -e 's/C//g')
		
		if [ $daytemp -gt $t ]; then
			t=$daytemp
			hotday=$(basename $daydir)
		fi
	done
done
echo "Hottest day of Nov 2011 was $hotday and the temperature was $t"
