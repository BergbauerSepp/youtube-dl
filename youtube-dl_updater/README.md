Automatischen updaten von youtube-dl per pip3.

youtube-dl muss dazu mit pip3 instaliert worden sein.


crontab -e

0   0   * * *   /home/debian/bin/ytdl_updater.sh > /dev/null
