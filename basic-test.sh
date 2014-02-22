#!/bin/bash 
for f in `find /Users/benoit/ -type f -iname \*.jpg`
do
  identify $f -format "%[fx:w/72] by %[fx:h/72] inches"
done