# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is a way of recording changes to documents.  It's important for several reasons.  First, when multiple people are working on a project, it's essential to keep track of the changes that each person makes and to integrate them into a centralized set of files.  Second, it can be useful as a way of keeping track of when changes were made, which can be useful in tracking down bugs.  It also allows changes to be rolled back if necessary.

* What is a branch and why would you use one?

A branch is a duplicate set of files created for the purpose of making changes.  A programmer can make changes to files in the branch, and then later merge them back into the master version of the files.

The purpose of using branches is to make sure people don't make changes directly to the master version of files, which could result in all sorts of problems (like unrecorded or incompatible changes).  Making changes to branches and then requiring approval for merger helps keep the master versions of the files clear.

* What is a commit? What makes a good commit message?

A "commit" is a form of save point when making changes to files.  After editing files, a programmer can stage the edited files and then commit the changes, along with a message explaining them.

A good commit message should describe the changes and their purpose.  It also should generally be concise.

* What is a merge conflict?

A merge refers to importing changes made in one branch of a project into the master version (or another branch).

A "merge conflict" occurs when incompatible changes have been made to the two branches being merged.  For example, if changes have been made to a single file in both the master version and a branch, trying to merge that branch might result in a merge conflict.

Git automatically identifies merge conflicts within the text of a file.  The conflicts need to be resolved before the merge can be completed.