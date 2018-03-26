#!/bin/bash

PIDFILE="./pid"
if [ ! -f "$PIDFILE" ]
then
    echo "no server to stop (could not find file $PIDFILE)"
else
    kill $(cat "$PIDFILE")
    echo "server [`cat $PIDFILE`] STOPPED"
    rm -f "$PIDFILE"
fi
exit 0