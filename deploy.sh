#!/bin/bash

# Only use this on master!

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
npm run build

# Copy from dist folder to public folder (yes, super ugly but had problems adding "dist" as a submodule)
cp -a ./dist/* ./public 

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

echo -e "\033[0;32mSuccessfully deployed\033[0m"