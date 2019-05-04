#!/usr/bin/env bash

set -e

# create build directory
rm -rf out/
mkdir out/
cp -r src/ out/

# interpolate
rm -f interp/99_NOW
date > interp/99_NOW

for f in interp/*; do
    filename=$(basename "$f" | cut -c4-)
    find out/ -type f -exec sed -e "/##$filename##/  {" -e "r $f" -e "d" -e "}" -i {} \;
done
