#!/bin/sh
# Usage: ./git-pr.sh <pr-number> [[<remote>] <new-local-branch>]

REMOTE="origin"
LOCAL_BRANCH_PREFIX="pr/"

show_usage()
{
	echo "\nUsage: ./git-pr.sh <pr-number> [[<remote>] <new-local-branch>]"
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

git fetch $REMOTE refs/pull/$1/head:$LOCAL_BRANCH \
&& git checkout $LOCAL_BRANCH
