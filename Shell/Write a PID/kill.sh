#!/bin/bash

for pid in `ps -ef | grep "{process_name}" | awk '{print $2}'` ; do kill -9 $pid ; done