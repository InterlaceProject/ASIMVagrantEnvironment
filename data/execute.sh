#!/bin/bash

#load config
. asimrc

#load specification
eval cd $tools
eval node loadICEF.js $project/ASIMSpec/run.icef localhost 9090
