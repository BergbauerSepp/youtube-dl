#!/bin/bash

YOUTUBE_DL="/usr/local/bin/yt-dlp"
YOUTUBE_DSTv="/mnt/Freecom_HDD/youtube-dl/YouTube_video_manuel"
YOUTUBE_DSTa="/mnt/Freecom_HDD/youtube-dl/YouTube_audio_manuel"
mkdir -p $YOUTUBE_DSTv
mkdir -p $YOUTUBE_DSTa

echo
echo " ============================================================"
echo " | +~+~+~+~+~+ Youtube Audio & Video Downloader +~+~+~+~+~+ |"
echo " ============================================================"
#echo
#echo "Video $YOUTUBE_DSTv"
#echo "Audio $YOUTUBE_DSTa"
#echo
echo
echo
read -p "link: " LINK
#clear
$YOUTUBE_DL -F $LINK
echo
echo
echo
echo
echo "       ============================================================"
echo "    +~+~+ Zuerst Videoformat dann Audioformat, Beispiel: 137+140 +~+~+"
echo " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo
echo
read -p "Format: " FORMAT

echo
read -p "aria2c verwenden? [J/n]: " BUCHSTABE
BUCHSTABE="${BUCHSTABE:=j}"
case $BUCHSTABE in


j) cd "$YOUTUBE_DSTv"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --download-archive downloaded.txt \
    --no-mtime \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --no-check-certificate \
    --external-downloader aria2c \
    --external-downloader-args "--min-split-size=1M --max-connection-per-server=16 --split=16 --max-concurrent-downloads=16 --file-allocation=none" \
    -f $FORMAT \
    --output "%(title)s %(id)s %(height)sp.%(ext)s" \
    $LINK \
	;;

n) cd "$YOUTUBE_DSTv"
   $YOUTUBE_DL \
    --ignore-errors \
    --ignore-config \
    --no-warnings \
    --no-mtime \
    --xattrs \
    --add-metadata \
    --embed-thumbnail \
    --no-overwrites \
    --no-post-overwrites \
    --no-check-certificate \
    -f $FORMAT \
    --output "%(title)s %(id)s %(height)sp.%(ext)s" \
    $LINK \
	;;

 *) echo "ungültige Option" ;;


esac
