#!/bin/bash
#waits for files to be created into $1 folder and makes a hipstafied copy to subfloder hipstafied

if [ ! -d "$1/hipstafied" ] && ! mkdir "$1/hipstafied" ;then
	echo Error creating hipstafied-directory
	exit 0
fi

inotifywait -m -e create -e moved_to "$1" | while read -r line
do
	filename="$1/"$(echo $line | cut -d' ' -f3)
	
	if [[ "$filename" =~ \.(jpg|jpeg)$ ]]
	then
		echo Hipstafying file $filename
		./hipstafy.sh $filename
	fi
done
