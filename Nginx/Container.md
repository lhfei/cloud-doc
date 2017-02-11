
## catalina.sh
JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"

## startup.sh
# Change the execute line at the end to include jpda start

exec "$PRGDIR"/"$EXECUTABLE" start "$@"
exec "$PRGDIR"/"$EXECUTABLE" jpda start "$@"

