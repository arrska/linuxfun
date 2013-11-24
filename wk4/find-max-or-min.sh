#!/bin/bash
#find max or min

print_help() {
  echo "\
Usage: `basename $0` [-t] -c | -w -p dir
Arguments:
  -t        output as tab-separated values
  -c        find the coldest temperature
  -w        find the warmest temperature
  -p dir    search all subdirs of dir"
}


unset tsv
unset program
unset dirname

while getopts ":htcwp:" opt
do
	case $opt in
		h)
			print_help
			exit 0
			;;
		t)
			tsv=./in-tsv-format.sh
			;;
		c)
			if [ -z "$program" ]
			then
				program=./min-temp.sh
			else
				#echo "only one -w or -c pls"
				print_help
				exit 1
			fi
			;;
		w)
			if [ -z "$program" ]
			then
				program=./max-temp.sh
			else
				#echo "only one -w or -c pls"
				print_help
				exit 1
			fi
			;;
		p)
			if [ -z "$dirname" ]
			then
				dirname=$OPTARG
			else
				#echo "only one directory with -p thank you"
				print_help
				exit 1
			fi
			;;
		\?)
			#echo "what is this? -$OPTARG"
			print_help
			exit 1
			;;
		:)
			#echo "option -$OPTARG requires an argument"
			print_help
			exit 1
			;;
	esac
done

if [ -z "$program" ] || [ -z "$dirname" ]
then
	print_help
	exit 1
fi

if [ -z "$tsv" ]
then
	$program $dirname
else
	$program $dirname | $tsv
fi
