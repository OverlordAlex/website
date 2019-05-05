#!/usr/bin/env bash

set -e
now=$(date)

cp -fr out/* ../OverlordAlex.github.io/
cp -f .gitignore ../OverlordAlex.github.io/

cd ../OverlordAlex.github.io/
git add .
git commit -m "New website version: $now"
git push -f origin master
