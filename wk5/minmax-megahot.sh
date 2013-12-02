#!/bin/bash
#get max temp

find $1 -name hp-temps.txt -exec grep "PROCESSOR_ZONE" {} + | sed -e 's/\(\/\)\|\(\ \)\+/,/g' | rev | cut -d, -f9,8,5 | rev | sed -e 's/,/ /g' | sed -e 's/C//g' | \
{ 
	hd=
	ht=
	hot=0
	cd=
	ct=
	cold=99
	while read -r day time t
	do
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
