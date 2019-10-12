#!/bin/bash

pushd content/

echo "Optimize images in content dir..."

# Optimize image resources
for file in `find . -type f -name "*.png"`; do
  pngquant -f --ext '.opt.png' --quality 70-95 $file
done

for file in `find . -type f -name "*.jpe?g"`; do
  jpegoptim --strip-all -m90 --stdout $file > `echo $file | sed 's/\.jpe?g$/\.opt\.jpg/'`
done

echo "Copy images from content to static/img..."

find . -type f -name "*.opt.png" -or -name "*.opt.jpe?g" -or -name "*.opt.gif" \
| cpio -pdmu ../static/

for file in `find . -type f -name "*.opt.png" -or -name "*.opt.jpe?g" -or -name "*.opt.gif"`; do
  rm -f $file
done

popd

pushd static/

for file in `find . -type f -name "*.opt.png"`; do
  mv -f $file `echo $file | sed 's/\.opt\.[^\.]*$//'`.png
done

for file in `find . -type f -name "*.opt.jpe?g"`; do
  mv -f $file `echo $file | sed 's/\.opt\.[^\.]*$//'`.jpeg
done

for file in `find . -type f -name "*.opt.gif"`; do
  mv -f $file `echo $file | sed 's/\.opt\.[^\.]*$//'`.gif
done

popd
