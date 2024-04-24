#!/bin/bash

unsign () {
	if [ $# -ne 1 ]; then
		echo "Must supply function with a file name"
		exit 1
	fi

	local file=$1

    unsigned=$(echo $file|sed s/'\.p7s'/''/g);
	if [ -e $unsigned ]; then
		echo "skipping, $unsigned already exists"
		return 1909
	fi
    openssl smime -inform DER -verify -noverify -in "$file" -out "$unsigned" 2>/dev/null 1>&2; 
	if [ $? -eq 0 ]; then
		echo "done"
	else
		echo "oopsie"
	fi
	return $?
}

FILES=()

if [ $# -gt 0 ]; then
	f=$1
	if [ ! -r "$f" ]; then
		echo "$f is not readable"
		exit 1
	fi
	FILES+=($f)
else
	for f in *.p7s; do
		if [ -r "$f" ]; then
			FILES+=($f)
		fi
	done
fi

if [ ${#FILES[@]} -eq 0 ]; then
	echo "No p7s files found in the current directory"
	exit 0
fi

for f in $FILES; do
	echo "Unpacking $f ... "
	unsign $f
done

exit 0


