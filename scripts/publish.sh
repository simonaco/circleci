#!/bin/bash
git config --global user.email <your-user-email>
git config --global user.name <your-user-name>

# $AZURE_REPO_URL needs to be set in your projects Variables section
# and include both username and password, e.g: https://username:password@site.scm.azurewebsites.net:443/site.git
# Clone Azure repository
git clone $AZURE_REPO_URL ~/azure

# change into the local azure directory
cd ~/azure

# delete local repository azure contents
rm -rf *

# Copy /dist folder contents (our app)
for entry in ~repo/dist/*
do
  echo "$entry"
done
cp -rf ~/repo/dist/* .

git add -A
git commit --all --message "echo ($CIRCLE_BUILD_NUM)"

# Push changes to Azure
git push origin master
