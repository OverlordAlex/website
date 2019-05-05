#!/usr/bin/env bash

set -e

# create build directory
rm -rf out/
mkdir out/
cp -r src/* out/

# interpolate
rm -f interp/99_NOW
echo "<time>"$(date)"</time>" > interp/99_NOW

# do all the file templates
for f in interp/*; do
    filename=$(basename "$f" | cut -c4-)
    find out/ -type f -exec sed -e "/##$filename##/  {" -e "r $f" -e "d" -e "}" -i {} \;
done

# do the inline citations
find out/ -type f -exec sed -i -r "s/##\^(\[[[:digit:]]+\])##/<sup><a href=\"#citation\1\">\1<\/a><\/sup>/g" {} \;
# do the citaiton section
find out/ -type f -exec sed -i -r "s/##(\[[[:digit:]]+\])(.+)##/<tr id=\"citation\1\"><td align=\"right\">\1<\/td><td>\2<\/td><\/tr>/g" {} \;

# find the most recent blog post and make that the home page
recent=$(find out/blog/*.html -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ")
cp "$recent" out/index.html

# TODO generate the sitemap
