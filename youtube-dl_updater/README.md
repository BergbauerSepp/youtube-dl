Automatischen updaten von yt-dlp per pip3.

yt-dlp muss dazu mit pip3 instaliert worden sein.


crontab -e

0   0   * * *   /home/debian/bin/ytdl_updater.sh > /dev/null
