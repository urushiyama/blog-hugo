#!/bin/bash

bash optim_img.sh

bash format_text.sh

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Force to change BaseURL
for TARGET in `find . -name "*.html" -or -name "*.xml"`; do
  if [ "$(uname)" == 'Darwin' ]; then
    # macOS
    sed -i '' -e 's!http://localhost:1313!https://urushiyama.github.io!g' "$TARGET"
  else
    sed -i -e 's!http://localhost:1313!https://urushiyama.github.io!g' "$TARGET"
  fi
done

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push -f origin master

# Come Back up to the Project Root
cd ..
