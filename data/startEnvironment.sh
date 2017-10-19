#!/bin/bash

#load config
. asimrc

#start manager
eval cd $manager
node casima.js &
pid=$!

#wait for manager beeing ready
sleep 5
eval cd $icef

#run brapper
java -jar coreASIM/org.coreasim.biomics.wrapper/target/brapper.jar \
	-m localhost -mp 9090
pid2=$!
kill $pid $pid2
