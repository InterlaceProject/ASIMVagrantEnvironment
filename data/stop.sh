#!/bin/bash

echo "stop" > ~/cmdfifo &
pid=$!
sleep 4s
if [ -p ~/pids  ]
then
  kill $(<~/pids) 2>/dev/null
  kill $pid 2>/dev/null
fi
