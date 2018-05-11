#!/bin/bash

pushd content/

echo "Format text style in content dir..."

# Optimize image resources
for file in `find . -type f -name "*.md"`; do
  sed -i "" -e "s/、/，/g" -e "s/。/．/g" $file
done

popd
