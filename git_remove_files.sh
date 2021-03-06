#!/bin/bash
# https://help.github.com/articles/remove-sensitive-data/

git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch *.pdf' \
--prune-empty --tag-name-filter cat -- --all

echo "*.pdf" >> .gitignore
git add .gitignore
git commit -m "Add *.pdf to .gitignore"

git push origin --force --all
