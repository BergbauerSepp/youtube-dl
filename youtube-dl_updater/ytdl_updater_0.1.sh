#!/bin/bash

RUN=`ps aux | grep python.*youtube-dl | grep -v grep | wc -l`
if [[ $RUN -gt 0 ]]; then
    echo "some instance of youtube-dl is already running"
    exit
fi


sudo pip3 install --upgrade youtube_dl




