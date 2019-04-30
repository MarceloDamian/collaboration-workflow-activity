$ git init
$ echo "My first file" > file1 ; git add file1
$ git commit . -m "Added file1 to empty repository"
$ echo "My second file" > file2 ; git add file2
$ git commit . -m "Added file2 "
$ git checkout -b branch1
$ echo "My third file" >|  file3 ; git add file3
$ git commit . -m "Updated file3"
$ echo "New file in branch1" > file4 ; git add file4
$ git commit . -m "Added file4 to this branch"
$ git checkout master
$ echo "new file in master" > file5 ; git add .
$ git commit . -m "Added file5 to master"
$ echo "My latest third file" >|  file3 ; git add file3
$ git commit . -m "Updated file3"
