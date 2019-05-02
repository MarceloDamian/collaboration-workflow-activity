
### Objective

The purpose of this activity is to give you some practice in synchronizing your
work with the work of team members on a group project that uses Git for
version control. However, this activity, unlike several others in this course,
has been designed as an individual exercise rather than a team exercise.
The reason for this is that it allows you to do the exercise independently, and as
often as you wish.


### Requirements

1. This activity is based on the assumption that you have read the slides on
collaboration workflows that I published on the course website:
[Collaboration Workflows: Basics](http://www.compsci.hunter.cuny.edu/~sweiss/course_materials/csci395.86/slides/collaborating_workflows.html)
.
These slides cover the basics about remotes, branching, and methods of
synchronizing repositories. A second set of slides  specifically covers
merging and rebasing and is also published on the website. They are not complete
yet, but contain sufficient material:
[Tutorial on Merging and Rebasing](http://www.compsci.hunter.cuny.edu/~sweiss/course_materials/csci395.86/slides/git_merge_rebase.html).
They also assume that you are familiar with how to clone and fork repositories on
GitHub.


2. Although any Git server could be used for this activity, the instructions
are based on the assumption that you have a `GitHub` account. If you choose to
use some other source code hosting server, just replace references to GitHub by that
server throughout.

3. Though not a strict requirement, you will get much more benefit out of this
activity if you have installed a graphical Git viewer of some kind. Several of these
viewers are actually graphical front-ends to Git, but I discourage you from
using them for this purpose. The purpose of using a viewer while doing this
activity is to see visually how the graph representation of the repository's history
changes as a result of various Git commands. It is _not_ to replace using the
command-line!

   One choice is __`Qgit`__ and the other is __`gitg`__. I prefer `gitg`.
Both are open source, and both can be installed from repositories in Ubuntu.
For other Linux systems, do a browser search and find the repositories for your system.
`gitg` is available for 64-bit Windows and in source code tarballs here:
[https://wiki.gnome.org/Apps/Gitg](https://wiki.gnome.org/Apps/Gitg)
 and `Qgit` has a repository on GitHub: [Qgit](https://github.com/tibirna/qgit).

   If you use `gitg`, you might need to open up your Preferences menu item
and in the second tab, make sure that the "`Show all branches`" box is selected
and that "`Show history in topological order`" is selected. You might aLso need to
use the "Reload" item after you make changes - it does not seem to reload
automatically all of the time.

   If you cannot install such a viewer, the fall-back is to open another terminal
window, navigate to the repository directory, and use

    ```bash
       git log --oneline --graph --all
    ```

    which shows both branches and all commits.

5. These instructions assume you are working in a terminal window, naturally.


### Setup

1. Clone this repository onto your local machine.

2. Make the two scripts in this repository, `create_demo_repo.sh` and
`make_repo_with_conflict.sh` executable:

    ```bash
      $ chmod +x ~/bin/create_demo_repo.sh make_repo_with_conflict.sh
    ```
    __[Optional Step]__ If you want to be able to run them without having to
from any directory, just by typing their names, then copy them into a
directory that is listed in your shell's `PATH` variable, such
as `~/bin`, as they might be useful to have for future use. The script
`make_repo_with_conflict.sh` creates a repository with a merge conflict so that
you can practice resolving it. If you mess it up, you can just delete it and
run the script again.

2. Follow the instructions in the file `Instructions.md` in this repository.

3. Have fun. I think it is cool to see how Git works visually and to see how
powerful it is.
