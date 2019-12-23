#!/bin/bash

# This script helps you create a new script in a bin directory. It sets the permission and opens the script for you in a file editor.
# Be sure to have a default editor set: Export EDITOR=nano

# Is there an argument?
if [[ ! $1 ]]; then
	echo "Missing argument"
	exit 1
fi

scriptname="$1"
currentdir=$(pwd)
bindir="$currentdir/bin"
filename="${bindir}/${scriptname}"

if [[ -e $filename ]]; then
	echo "File ${filename} already exists"
	exit 1
fi

if type "$scriptname"; then
	echo "There is already a command with name ${scriptname}"
	exit 1
fi

# Check bin directory exists
if [[ ! -d $bindir ]]; then
	# if not: create bin directory
	if mkdir "$bindir"; then
		echo "created ${bindir}"
	else
		echo "Could not create ${bindir}."
		exit 1
	fi
fi

# Create a script with a single line
echo '#!/bin/bash' > "$filename"
# Add executable permission
chmod u+x "$filename"
# Open with editor
if [[ $EDITOR ]]; then 
	$EDITOR "$filename"
else
	echo "Script created; not starting editor because \$EDITOR is not set."
fi

if [[ -e $filename ]] && [[ -x $filename ]]; then
	echo "File looks good and ready to be executed by you!"
else
	echo "There was an error please try again!"
fi