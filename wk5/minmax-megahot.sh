#!/bin/bash
#get max temp

# sed -e 's/.*\/\([0-9]*\.[0-9]*\.[0-9]*\)\/\([0-9]*:[0-9]*\).*PROCESSOR_ZONE *\([0-9]\+\)C.*/\1\ \2 \3/g'
find $1 -name hp-temps.txt -exec grep "PROCESSOR_ZONE" {} + |  sed -e 's/.*\/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\/\([0-9]*:[0-9]*\).*PROCESSOR_ZONE *\([0-9]\+\)C.*/\1\.\2\.\3 \4 \5/g' | \
{ 
	hd=
	ht=
	hot=0
	cd=
	ct=
	cold=99
	while read -r day time t
	do
		#echo $day $time $t
		if [ $t -lt $cold ]
		then
			ct=$time
			cd=$day
			cold=$t
		fi
		if [ $t -gt $hot ]
		then
			ht=$time
			hd=$day
			hot=$t
		fi
	done

	echo min: $cd $ct $cold
	echo max: $hd $ht $hot
}
