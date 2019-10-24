#!/bin/bash
# Creates a forked repository for experimenting and exploring
# various synchronization methods using git.
# Written by Stewart Weiss, April 20, 2019
# Modified by Stewart Weiss, October 20, 2019
#
#
# USAGE:  create_demo_repo.sh  <new-repository-name>
#     This will create a repository with the given name in the
#     current working directory, assuming you have write-permission
#     in that directory. The structure of this repository is easily
#     modified by tinkering with the parameters of this script.
#
# License        : Copyright 2019 Stewart Weiss
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
#
#
# Define various branch lengths
master_branch_length=3
feature1_branch_length=2


# Check usage
if [ $# -lt 1 ] ; then
    echo "usage: `basename $0` repository_name "
    exit
fi

# Initialize an empty repository in the current working directory
git init $1
if [ $? -ne 0 ] ; then
    echo "Error trying to create repository named $1"
    exit
fi

# Navigate into the repository
cd $1

# Create a README.md file, stage and commit it.
echo "This is a repository designed to practice a workflow using " > README.md
echo "fetch, merge, rebase, and a few other git commands." >> README.md
git add README.md ; git commit . -m "Created and initialized README.md"


# Create some files and one new commit in master branch
for i in `seq 1 ${master_branch_length}` ; do
    echo "This is line ${i} of the file named file${i}." > file${i} ;
    git add file${i} ;
done
git commit -m "Added several files." .

# Create a new branch named feature1 and add some commits to it
git checkout -b feature1

for i in `seq 1 ${feature1_branch_length}` ; do
    echo " Line ${i}: Working on feature 1, a new feature we are considering. " > feature1_${i} ;
    git add feature1_${i} ;
    git commit . -m "Added the file feature1_${i}."
done

# Make a change to  file1 in feature1 branch
echo "Replaced the original file:  New line 1" >| file1 ;
git add file1 ;
git commit . -m "Replaced file1 contents"

# Add two more commits to master so that the history is branched
# In particular we will force a conflict when we try to merge or rebase
git checkout master
for i in `seq 1 ${master_branch_length}` ; do
    echo "Change #${i}: we modified line 1 in file${i}" >| file${i} ;
    git add file${i} ;
    git commit . -m "Modified file${i}"
done


# Navigate back to the previous directory
cd $OLDPWD
