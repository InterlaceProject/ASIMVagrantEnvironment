#!/bin/bash

# execute on quit
function quit {
      echo "stop" > ~/in
      echo "stopping ..."
      sleep 2s
      kill $(<~/pids) 2>/dev/null
      rm ~/in ~/cmdfifo ~/pids

      echo "done."
      exit 0
}

#set environment variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/asimrc

rm -f ~/in ~/cmdfifo ~/pids

# start manager
eval cd $manager
node casima.js &
echo $! > ~/pids

# wait for manager beeing ready
sleep 5
eval cd $icef

# create fifo brapper
if [ ! -p in ]; then
    mkfifo ~/in
fi
# run brapper in background
((tail -f ~/in & echo $!>&3) 3>>~/pids) | java -jar coreASIM/org.coreasim.biomics.wrapper/target/brapper.jar \
	-m localhost -mp 9090 2>&1 &
echo $! >> ~/pids

#load specification run.icef
sleep 5s; \
  echo "-------------------- submitting icef to manager -------------------"; \
  eval cd $tools; \
  eval node loadICEF.js $project/ASIMSpec/run.icef localhost 9090

# create fifo for commands
if [ ! -p in ]; then
    mkfifo ~/cmdfifo
fi

# execute quit function on ctrl + c
trap quit 2

# wait for stop command
while true
do
  while read cmd
  do
    echo "read: $cmd"
    if [ "$cmd" = "stop" ]
    then
      quit
    fi
  done < ~/cmdfifo
done
