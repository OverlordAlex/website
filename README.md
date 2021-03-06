# Introduction
Welcome to the source for my website:
https://itsabugnotafeature.com

# Usage
Use `./build.sh` to create the website in `out/*`
Then use `./deploy.sh` to copy it to the website repo and push it to deploy

# Structure
interp - common elements that are interpolated into the src
templates - common structure for similar pages
src - website contents
src/resources - static resources required

# TODO
* Make a structure with subdomain pages
  * blog -> redirects to the homepage? (make sure index.html script works as expected)
  * projects -> art, juggling, portfolio etc that require a home
  * api -> programmatic endpoint
* Make an image replacement macro for correct responsive images
* Work on the CSS colours (dark theme?)
* Runlocal for local testing
* Add link-backs to the footnotes
* Add styling to have footnotes appear in-line on the side when the page is large enough
* Condense multiple footnotes into a single <sup>
* Add searching functionality?
  * Add labels or tags to posts
* Include commit messages to the pages repo to form a changelog
* Add custom 404 page
