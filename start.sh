#!/bin/bash
git clone https://github.com/developeranaz/Jdownloader-2-Rclone-Heroku
chmod +x /Jdownloader-2-Rclone-Heroku/scripts/ENV_VPS
bash  /Jdownloader-2-Rclone-Heroku/scripts/ENV_VPS
cp /Jdownloader-2-Rclone-Heroku/jd.sh /jd.sh
chmod +x /jd.sh
cp /Jdownloader-2-Rclone-Heroku/serve.sh /serve.sh
chmod +x /serve.sh
cp /Jdownloader-2-Rclone-Heroku/scripts/rclone.sh /rclone.sh
chmod +x /rclone.sh
cat /Jdownloader-2-Rclone-Heroku/cr.json |sed "s|THEJDUSERPASSWORD|$JD_USER_PASSWORD|g" |sed "s|THEJDUSEREMAIL|$JD_USER_EMAIL|g" >"/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
supervisord -c /Jdownloader-2-Rclone-Heroku/supervisord.conf
