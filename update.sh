#!/bin/bash

for FILE in */*.json */**/*.json; do
	if [ ! -h $FILE ]; then
		LINK="$(dirname $FILE).json"
		
		if [ ! -h $LINK ]; then
			echo "Creating link: $LINK -> $FILE"
			ln -sr $FILE $LINK
		elif [[ $(basename $FILE) > $(basename $(readlink $LINK)) ]]; then
			echo "Updating link: $LINK -> $FILE"
			ln -sfr $FILE $LINK
		fi
	fi
done
