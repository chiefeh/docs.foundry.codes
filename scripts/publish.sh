#!/bin/sh

# Publish the site by compiling source markdown files into HTML in the `/docs`
# directory, and pushing them to the `gh-pages` branch of the repo.

set -euo pipefail

main () {
  compile_html
}


compile_html() {
  # Export the ROOT_DOCPATH env. var which is required by the patched tech-docs
  # gem code
  #export ROOT_DOCPATH=$(site_root)

  bundle exec middleman build --build-dir docs --relative-links
  touch docs/.nojekyll
}
