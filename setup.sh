#!/bin/sh

CURRENT_PATH=$(pwd)
ALIAS_COMMAND="alias git-pr-local='sh $CURRENT_PATH/git-pr-local.sh'"

echo "\n$ALIAS_COMMAND" >> ~/.bashrc
echo "\n$ALIAS_COMMAND" >> ~/.bash_profile
echo "\n$ALIAS_COMMAND" >> ~/.profile
echo "\n$ALIAS_COMMAND" >> ~/.zshrc
