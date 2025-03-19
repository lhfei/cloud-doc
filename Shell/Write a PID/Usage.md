### Kill process by PORT

```shell
#!/bin/bash

if [ -z "$1" ]; then
  echo "usage: $0 <port number>"
  exit 1
fi

PORT=$1

# find process id by port
PID=$(lsof -ti :$PORT)


if [ -z "$PID" ]; then
  echo "No process found for '$PORT' ."
else
  echo "The service process ID of port number '$PORT' is: $PID"

  # try to kill the process
  if kill -9 $PID; then
    echo "The process has been killed"
  else
    echo "Unable to kill process. PID is $PID"
    exit 1
  fi
fi

exit 0
```

