#!/bin/bash
# first I have to to this in terminal:   chmod +x yourscript.sh

# Display git status

git status

# Ask user whether to add all files or specific ones
read -p "Do you want to add all changes? (y/n) " answer_all

# Add changes to the Git Index
if [[ $answer_all =~ ^[Yy]$ ]]
then
    git add .
else
    read -p "Enter the specific files to add: " specific_files
    git add $specific_files
fi

# Get the commit message
echo "Enter the commit message: "
read commit_message

# Commit changes
git commit -m "$commit_message"

# Confirm before pushing to the repository
read -p "Do you want to push the changes to the repository? (y/n) " answer_push

case $answer_push in
    [Yy]* ) git push origin main;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
esac