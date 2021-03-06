# config merge tool
git config --global --add merge.tool kdiff3
git config --global --add mergetool.kdiff3.path "D:/bin/kdiff3/kdiff3.exe"
git config --global --add mergetool.kdiff3.trustExitCode false

# diff tool
git config --global --add diff.guitool kdiff3
git config --global --add difftool.kdiff3.path "D:/java/KDiff3/kdiff3.exe"
git config --global --add difftool.kdiff3.trustExitCode false
git config --global --add difftool.prompt false
