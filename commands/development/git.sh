#!/bin/bash

# removing files added in .gitignore
git rm --cached $FILE_NAME
git rm -r --cached $DIR_NAME

# create branch from stash
git stash branch $STASH_CHANGES_2_NEW_BRANCH

# delete commited files
git clean $FILE_NAME
# show files to delete 
git clean --dry-run 

# create custom commands en git
git config --global alias.$COMMAND_NAME "$GIT_LONG_COMMAND"

# show current branch
git branch | grep '*' | awk '{ print $2 }'

# show files changes
git log -p $COMMIT_ID