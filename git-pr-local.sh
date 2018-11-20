#!/bin/sh
# Usage: git-pr-local <pr-number> [<remote> [<new-local-branch> [-f|--force]]]

REMOTE="origin"
LOCAL_BRANCH_PREFIX="pr/"
FORCE=""

show_usage()
{
	echo "\nUsage: git-pr-local <pr-number> [<remote> [<new-local-branch> [-f|--force]]]"
}

if [ -z "$1" ]; then
	echo "No PR Number specified"
	show_usage
	exit
else
	LOCAL_BRANCH=$LOCAL_BRANCH_PREFIX$1
fi

if [ -z "$2" ]; then
	echo "No remote specified. Using default: $REMOTE"
else
	REMOTE=$2
fi

if [ -z "$3" ]; then
	echo "No local branch name specified. Using default: $LOCAL_BRANCH"
else
	LOCAL_BRANCH=$3
fi

if [ ! -z "$4" ] && [ "$4" != "-f" ] && [ "$4" != "--force" ]; then
	echo "The argument for force fetch is \"-f\" or \"--force\""
	show_usage
	exit
else
	FORCE=$4
fi

git fetch $FORCE $REMOTE refs/pull/$1/head:$LOCAL_BRANCH \
&& git checkout $LOCAL_BRANCH
