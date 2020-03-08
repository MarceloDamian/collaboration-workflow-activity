#!/bin/bash
# make_repo_with_conflict.sh  --
#
# Usage           : make_repo_with_conflict.sh
# Written by      : Stewart Weiss
# Created on      : April 29, 2019
#
# Modified        : May 2, 2019 by SNW
#                   Changed the usage so that it expects a directory name
#                   argument and creates the repo in that directory.
#                   If the directory exists it will  create it in that
#                   directory.
#                 : March 8, 2020 by SNW
#                   Added more comments and changed what gets written into files

# Description     :
# A tiny script that creates a git repository with a merge conflict
# that must be resolved manually. When it is run, it creates a git
# repository in the current working directory, with a few small files in it.
#
# After running the script, you can either try a merge or a rebase.
# If a rebase, do the following:
#    git checkout branch1
#    git rebase master
# and handle it from there (follow Git's instructions)
#
# If a merge, stay on master and merge branch1 into it:
#    git merge branch1
# Then handle the merge conflict as instructed.

# License        : Copyright 2020 Stewart Weiss
#
#     This code is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This code is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <https://www.gnu.org/licenses/>.


#*******************************************************************************


# Check usage
if [ $# -lt 1 ] ; then
    echo "usage: `basename $0` repository_name "
    exit
fi

# Initialize an empty repository in the given directory
git init $1
if [ $? -ne 0 ] ; then
    echo "Error trying to create repository named $1"
    exit
fi

# Navigate into the repository
cd $1

# Create two files in master branch first
echo "This is the first file." > file1 ; git add file1
git commit . -m "Added file1 to empty repository"
echo "This is the second file." > file2 ; git add file2
git commit . -m "Added file2 "

# Create and switch to a new branch named branch1
git checkout -b branch1

# Create a third file in the new branch
echo "This is the third file." >  file3 ; git add file3
git commit . -m "Updated file3"

# Switch to master and create a new commit by adding a fourth file
git checkout master
echo "This is the fourth file" > file4 ; git add .
git commit . -m "Added file4 to master"

# Now create the conflict: Create a file named file3 in master with a different
# first line:
echo "This is a better file3 than we had before." >  file3 ; git add file3
git commit . -m "Updated file3"

# If you try to merge branch1 into master it will cause a merge conflict.
# Or if you try to merge master into branch1, same problem.

# Navigate out to the working directory
cd $OLDPWD

