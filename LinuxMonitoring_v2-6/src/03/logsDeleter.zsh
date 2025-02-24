#!/bin/zsh

rm 03.log
find ../../src/ -mindepth 1 -maxdepth 1 -type d \
! -regex ".*/\(01\|02\|03\|04\|05\|06\|07\|08\|09\)" -print0 | xargs -0 rm -rf