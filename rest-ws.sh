#!/bin/bash

GIT=`which git`
GIT_REMOTE="https://github.mlbam.net/btsou/git-demo"

echo "Enter the name of the project:"
read PROJ_DIR

# Input checks
if [ -z "$GIT" ]; then
	echo "git is not installed. Abort."
	exit 1
fi

if [ -z "$PROJ_DIR" ]; then
	echo "Please specify a project name."
	exit 1
fi

if [ -d "$PROJ_DIR" ]; then
	echo "Directory $PROJ_DIR already exists."
	exit 1
fi

printf "It's a go! Creating a project @ \e[36m$PROJ_DIR\e[0m from \e[2m$GIT_REMOTE\e[0m\n"
`$GIT clone $GIT_REMOTE $PROJ_DIR`

# Clean up
echo "Clean up."
`rm -rf ./$PROJ_DIR/.git`

echo "All done. 👍"
