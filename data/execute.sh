#!/bin/bash

. asimrc

eval cd $tools
eval node loadICEF.js $project/ASIMSpec/run.icef localhost 9090
