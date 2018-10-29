#!/bin/sh

CURRENT_PATH=$(pwd)
alias git-pr-local='sh $CURRENT_PATH/git-pr-local.sh'

echo "\nalias git-pr-local='sh $CURRENT_PATH/git-pr-local.sh'" >> ~/.bashrc
echo "\nalias git-pr-local='sh $CURRENT_PATH/git-pr-local.sh'" >> ~/.bash_profile
echo "\nalias git-pr-local='sh $CURRENT_PATH/git-pr-local.sh'" >> ~/.profile
