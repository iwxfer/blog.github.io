https://backlog.com/git-tutorial/rewriting-history/#git-merge-squash
https://thoughtbot.com/blog/git-interactive-rebase-squash-amend-rewriting-history

## Ammend ##

# change comment
git commit --amend

# change files (add/delete/edit)
git add README.md config/routes.rb
git rm notes.txt
git commit --amend

# change author
git commit --amend --author="Tute Costa and Dan Croak <tute+dan@thoughtbot.com>"


## Interactive Rebase ##

# change the last 4 commits

git rebase -i HEAD~4

## Squash commits together ##

## Rebase on top of master ##
git remote add upstream  https://github.com/thoughtbot/factory_girl.git
git fetch upstream 
git checkout feature
git rebase upstream/master
git push --force origin feature