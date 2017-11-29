#!/bin/bash

function quit {
      echo "stop" > ~/in
      echo "stopping ..."
      sleep 2s
      kill $(<~/pids) 2>/dev/null
      rm ~/in ~/cmdfifo ~/pids

      echo "done."
      exit 0
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/asimrc

rm -f ~/in ~/cmdfifo ~/pids

#start manager
eval cd $manager
node casima.js &
echo $! > ~/pids

#wait for manager beeing ready
sleep 5
eval cd $icef

#run brapper in background
if [ ! -p in ]; then
    mkfifo ~/in
fi
((tail -f ~/in & echo $!>&3) 3>>~/pids) | java -jar coreASIM/org.coreasim.biomics.wrapper/target/brapper.jar \
	-m localhost -mp 9090 2>&1 &
echo $! >> ~/pids

####load specification
sleep 5s; \
  echo "-------------------- submitting icef to manager -------------------"; \
  eval cd $tools; \
  eval node loadICEF.js $project/ASIMSpec/run.icef localhost 9090

### some stdout logging
echo ~/pids

if [ ! -p in ]; then
    mkfifo ~/cmdfifo
fi

trap quit 2

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
