#!/bin/sh

CURRENT_PATH=$(pwd)
ALIAS_COMMAND="alias git-pr-local='sh $CURRENT_PATH/git-pr-local.sh'"
ALIAS_COMMAND_REGEX="alias git-pr-local.*"

declare -a SUPPORTED_TERMINAL_FILES=(".bashrc" ".bash_profile" ".profile" ".zshrc")

# Run the command in current context
eval $ALIAS_COMMAND

for file in "${SUPPORTED_TERMINAL_FILES[@]}"
do
	# Only try adding alias to profiles when the file is readable && writable
	if [ -w ~/"$file" ] && [ -r ~/"$file" ]
	then
		# Remove older added aliases before adding the new ones
		sed -i "s/$ALIAS_COMMAND_REGEX//g" ~/"$file" 2>/dev/null
		# For MacOS, `sed -i` expects '' argument, otherwise fails with weird errors
		sed -i '' "s/$ALIAS_COMMAND_REGEX//g" ~/"$file" 2> /dev/null

		# Add the alias
		echo "\n$ALIAS_COMMAND" >> ~/"$file"
	else
		echo "Skipping adding alias command to ~/$file since we don't have read and write permissions"
	fi
done
