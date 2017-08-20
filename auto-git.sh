#!/bin/bash
set -e
DATE=`date`
git add . && git commit -m "${DATE}" && git push -u origin master
