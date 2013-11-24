#!/bin/bash


for file in $(find $1monitor/ -maxdepth 1 -mindepth 1 | sort)
do
	./max-temp.sh $file | ./in-tsv-format.sh
done
