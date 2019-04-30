#!/bin/bash
# make_repo_with_conflict.sh  -- 
# 
# Usage           : make_repo_with_conflict.sh  
# Written by      : Stewart Weiss 
# Created on      : April 29, 2019
              
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

# MIT License
#
# Copyright (c) 2019 Stewart Weiss
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#*******************************************************************************             


git init
echo "My first file" > file1 ; git add file1
git commit . -m "Added file1 to empty repository"
echo "My second file" > file2 ; git add file2
git commit . -m "Added file2 "
git checkout -b branch1
echo "My third file" >|  file3 ; git add file3
git commit . -m "Updated file3"
echo "New file in branch1" > file4 ; git add file4
git commit . -m "Added file4 to this branch"
git checkout master
echo "new file in master" > file5 ; git add .
git commit . -m "Added file5 to master"
echo "My latest third file" >|  file3 ; git add file3
git commit . -m "Updated file3"


