#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build it
hugo

# add it
git add -A

# commit it
msg="rebuilding site `date`"
if [ $# -eq 1 ]
    then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=public https://github.com/crookedstorm/stormblog.git gh-pages
