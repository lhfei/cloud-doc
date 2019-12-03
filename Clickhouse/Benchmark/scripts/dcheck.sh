#!/bin/bash

SCHEMA="bc_online"
OUT_DIR="rows"
for tb in `cat ./tbs.txt`

do
  
  echo "count rows in table $tb ..."

  clickhouse-client --query "select count(*) from ${SCHEMA}.$tb" >> ${OUT_DIR}/$tb.txt

done
