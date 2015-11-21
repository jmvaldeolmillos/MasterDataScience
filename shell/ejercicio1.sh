#!/bin/bash

# title		: script.sh
# date		: 2015-11-16
# author	: Jose Manuel
# version	: 1.0
# description	: This script returns the aircrafts with n numbers of engines order by manufacturer
# options	: $1 name of file, $2 number of engines

clear

if [ $# -le 1 ]
then
	echo "No correct arguments!!"
	exit 1
fi
aircrafts=`csvgrep -d "^" -c nb_engines -r $2 $1 | csvlook | wc -l`
aircrafts=$((aircrafts - 4))
if [ $aircrafts -le 0 ]
then
	echo "There aren't aircrafts with $2 engines."
	exit 1
fi
csvcut -d "^" -c manufacturer,model,nb_engines $1 | csvgrep -c nb_engines -r $2 | csvsort | csvlook
echo
echo "There are $aircrafts aircrafts with $2 engines."
echo
