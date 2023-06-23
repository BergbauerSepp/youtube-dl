#!/bin/bash

RUN=`ps aux | grep python.*yt-dlp | grep -v grep | wc -l`
if [[ $RUN -gt 0 ]]; then
    echo "some instance of yt-dlp is already running"
    exit
fi


sudo python3 -m pip install --upgrade yt-dlp




