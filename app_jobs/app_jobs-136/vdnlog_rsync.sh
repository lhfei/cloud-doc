#!/bin/bash
cd /data/app_tmp/vdnlogs/input/

for i in 0
do
  #123.103.58.209
  rsync -avzP  --bwlimit=40960 122.49.8.209::vplayer/$(date +%Y-%m-%d -d -${i}day) ./
done
