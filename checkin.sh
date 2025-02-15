#!/bin/bash
# format: {problem #} [-d] [-r]
# -d: Don't push
# -r: Update readme
if [ -z $1 ]
  then
    echo "Problem # not provided"
    exit 1
fi
# https://www.aplawrence.com/Unix/getopts.html
push=true
readme=false

problem="$1"
shift # skip the problem # in argument processing
while getopts "dr" flag;
do
  case "$flag" in
    d) push=false;;
    r) readme=true;;
  esac
done

if [ "$readme" = true ] ; then
  ./readme.sh
  echo "README updated"
fi
git add README.md
git add leetcode/$problem.*
git commit -m $problem
if [ "$push" = true ] ; then
  git push
fi