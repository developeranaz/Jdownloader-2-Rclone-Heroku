#!/bin/bash
chmod +x /Jdownloader-2-Rclone-Heroku/up.sh
while :
do
cd /
curl "$conf_in_url" >/rclone.conf
curl 'https://gitlab.com/dev-extended/developeranaz-filehoster/-/raw/main/JDownloader/jd.tar.gz' -O
tar -xf /jd.tar.gz
cd /jdx
cat /Jdownloader-2-Rclone-Heroku/cr.json |sed "s|THEJDUSERPASSWORD|$JD_USER_PASSWORD|g" |sed "s|THEJDUSEREMAIL|$JD_USER_EMAIL|g" >"/jdx/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
cat /Jdownloader-2-Rclone-Heroku/ex.json > "/jdx/cfg/org.jdownloader.extensions.eventscripter.EventScripterExtension.json"
cat /Jdownloader-2-Rclone-Heroku/exs.json > "/jdx/cfg/org.jdownloader.extensions.eventscripter.EventScripterExtension.scripts.json"
java -jar JDownloader.jar -norestart -noerr -r
done
