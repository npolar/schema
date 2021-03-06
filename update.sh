#!/bin/bash

# Update minor-version symlinks
for FILE in *.json */*.json */**/*.json; do
	EXPR='^([0-9]{1,3}\.[0-9]{1,3})\.[0-9]{1,3}\.json$'
	ALT_EXPR='^(.+)-([0-9]{1,3}\.[0-9]{1,3})\.[0-9]{1,3}\.json$'
	
	if [[ $(basename $FILE) =~ $EXPR ]]; then
		LINK="$(dirname $FILE)/${BASH_REMATCH[1]}.json"
		
		if [ ! -h $LINK ]; then
			echo "Creating minor-version symlink: $LINK -> $FILE"
			ln -sr $FILE $LINK
		elif [[ $(basename $FILE) > $(basename $(readlink $LINK)) ]]; then
			echo "Updating minor-version symlink: $LINK -> $FILE"
			ln -sfr $FILE $LINK
		fi
	elif [[ $(basename $FILE) =~ $ALT_EXPR ]]; then
		LINK="$(dirname $FILE)/${BASH_REMATCH[1]}-${BASH_REMATCH[2]}.json"
		
		if [ ! -h $LINK ]; then
			echo "Creating alternate minor-version symlink: $LINK -> $FILE"
			ln -sr $FILE $LINK
		elif [[ $(basename $FILE) > $(basename $(readlink $LINK)) ]]; then
			echo "Updating alternate minor-version symlink: $LINK -> $FILE"
			ln -sfr $FILE $LINK
		fi
	fi
done

# Update major-version symlinks
for FILE in *.json */*.json */**/*.json; do
	EXPR='^[0-9]{1,3}\.[0-9]{1,3}\.json$'
	ALT_EXPR='^(.+)-[0-9]{1,3}\.[0-9]{1,3}\.json$'

	if [[ $(basename $FILE) =~ $EXPR ]]; then
		LINK="$(dirname $FILE).json"
		
		if [ ! -h $LINK ]; then
			echo "Creating major-version symlink: $LINK -> $FILE"
			ln -sr $FILE $LINK
		elif [[ $(readlink $FILE) > $(basename $(readlink $LINK)) ]]; then
			echo "Updating major-version symlink: $LINK -> $FILE"
			ln -sfr $FILE $LINK
		fi
	elif [[ $(basename $FILE) =~ $ALT_EXPR ]]; then
		LINK="$(dirname $FILE)/${BASH_REMATCH[1]}.json"
		
		if [ ! -h $LINK ]; then
			echo "Creating alternate major-version symlink: $LINK -> $FILE"
			ln -sr $FILE $LINK
		elif [[ $(readlink $FILE) > $(basename $(readlink $LINK)) ]]; then
			echo "Updating alternate major-version symlink: $LINK -> $FILE"
			ln -sfr $FILE $LINK
		fi
	fi
done
