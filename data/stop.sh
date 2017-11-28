#!/bin/bash

echo "stop" > ~/cmdfifo
sleep 4s
if [ -p ~/pids  ]
then
  kill $(<~/pids) 2>/dev/null
fi
