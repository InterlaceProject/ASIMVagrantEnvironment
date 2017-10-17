#!/bin/bash


cd ~/project/icef/manager/
npm start &
pid=$!
sleep 5
cd ~/project/icef/
java -jar coreASIM/org.coreasim.biomics.wrapper/target/brapper.jar \
	-m localhost -mp 9090 
pid2=$!
kill $pid $pid2
