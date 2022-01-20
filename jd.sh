#!/bin/bash
while :
do
cd /
curl 'https://gitlab.com/dev-extended/developeranaz-filehoster/-/raw/main/JDownloader/jd.tar.gz' -O
tar -xf /jd.tar.gz
cd /jdx
cat /Jdownloader-2-Rclone-Heroku/cr.json |sed "s|THEJDUSERPASSWORD|$JD_USER_PASSWORD|g" |sed "s|THEJDUSEREMAIL|$JD_USER_EMAIL|g" >"/jdx/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
java -jar JDownloader.jar -norestart -noerr -r
done
