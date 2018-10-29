#!/bin/sh
# Usage: ./git-pr.sh <base-branch> <remote> <pr-number> <new-local-branch>

git checkout $1 && git pull \
&& git fetch $2 refs/pull/$3/head:$4 \
&& git checkout $4
