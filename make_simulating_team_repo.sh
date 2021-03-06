#!/bin/bash
# This script replaces the manual task of adding new branches and commits
# directly on GitHub.
# Written by Stewart Weiss, April 20, 2019
# Modified by Stewart Weiss, October 20, 2019


# usage:  make_simulating_team_repo local_name github_repo_url
#         where local_name is a directory for the new repository and
#         github_url is the URL that GitHub gives you when you click the
#         clone button in the GitHub repository.

# Assuming your practice repository is named mydemo (replace it with real name)
# and is in the class organization, and that your current working directory
# is mydemo.

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

if [ $# -lt 2 ] ; then
    echo "usage: make_simulating_team_repo local_name github_repo_url"
    exit
fi

LOCAL=$1
UPSTREAM=$2

mkdir ../$LOCAL
cd ../$LOCAL

git init

git remote add origin $UPSTREAM
git pull origin master


git checkout master

for i in 1 2 ; do
    echo "new file in master: gh_file${i}" > gh_file${i}; git add gh_file${i};
    git commit . -m "Added gh_file${i}"
done

git checkout -b feature2

for i in 1 2 ; do
    echo "new file in feature2: feature2_file${i}" > feature2_file${i}; git add feature2_file${i};
    git commit . -m "Added feature2_file${i}"
done

git checkout master
git checkout -b exploratory

for i in 1 2 ; do
    echo "new file in exploratory: option${i}" > option${i}; git add option${i};
    git commit . -m "Added option${i}"
done

git checkout master

# Uncomment these lines when you are ready to push the repository to your upstream
# of it.
git push -u origin master
git push -u origin feature2
git push -u origin exploratory
