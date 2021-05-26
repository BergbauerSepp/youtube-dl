#!/bin/bash

YOUTUBE_DL="/usr/local/bin/youtube-dl"
YOUTUBE_DSTv="/mnt/Freecom_HDD/youtube-dl/YouTube_video_manuel"
YOUTUBE_DSTa="/mnt/Freecom_HDD/youtube-dl/YouTube_audio_manuel"
mkdir -p $YOUTUBE_DSTv
mkdir -p $YOUTUBE_DSTa

echo
echo "============================================================"
echo "| +~+~+~+~+~+ Youtube Audio & Video Downloader +~+~+~+~+~+ |"
echo "============================================================"
#echo
#echo "Video $YOUTUBE_DSTv"
#echo "Audio $YOUTUBE_DSTa"
#echo
echo
echo
read -p "YouTube link: " LINK
echo
echo "==============================="
echo "| +~+~+ Qualität wählen +~+~+ |"
echo "==============================="
echo
echo "1) 480p"
echo "2) 720p"
echo "3) 1080p"
echo "4) m4a 128k"
echo "5) mp3 -V4 160k"
echo "6) Kanal Download m4a 128k"
echo

read -p "Qualität: "  NUMMER
case $NUMMER in

1) cd "$YOUTUBE_DSTv"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -f 'bestvideo[height<=480][ext=mp4]'+m4a \
    --output "%(title)s %(id)s %(height)sp.%(ext)s" \
    $LINK \
  ;;


2) cd "$YOUTUBE_DSTv"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -f 'bestvideo[height<=720][ext=mp4]'+m4a \
    --output "%(title)s %(id)s %(height)sp.%(ext)s" \
    $LINK \
  ;;


3) cd "$YOUTUBE_DSTv"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -f 'bestvideo[height<=1080][ext=mp4]'+m4a \
    --output "%(title)s %(id)s %(height)sp.%(ext)s" \
    $LINK \
  ;;


4) cd "$YOUTUBE_DSTa"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -f m4a \
    --output "%(title)s %(id)s.%(ext)s" \
    $LINK \
  ;;

#    --output "%(title)s %(upload_date)s %(id)s.%(ext)s" \


5) cd "$YOUTUBE_DSTa"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -x --audio-format mp3 --audio-quality 4 \
    --output "%(title)s %(id)s.%(ext)s" \
    $LINK \
  ;;


6) cd "$YOUTUBE_DSTa"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -f m4a \
    --output "%(uploader)s/%(playlist)s/%(playlist_index)s - %(upload_date)s %(title)s %(id)s.%(ext)s" \
    $LINK \
  ;;


  *) echo "ungültige Option" ;;

esac
