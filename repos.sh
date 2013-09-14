#!/bin/sh

for r in $(cat 1001repos ); do
  rx=${r#https://github.com/}
  rn=${rx/\//-}
  echo Grabbing $r in $rn
  curl -s https://codeload.github.com/$rx/zip/master > $rn.zip
  sleep 2
done
