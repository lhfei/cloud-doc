#!/bin/bash
cd /data/app_tmp/vdnlogs/input/

for i in 1 2 3 4 5 6 7
do
  rsync -avzP  --bwlimit=4096 123.103.58.71::vplayer/$(date +%Y-%m-%d -d -${i}day) ./
done
