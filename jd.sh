#!/bin/bash
chmod +x /Jdownloader-2-Rclone-Heroku/up.sh
mkdir /jdx/jdownload
#cp /jdx/cfg/org.jdownloader.settings.GeneralSettings.json /jdx
#cat /jdx/org.jdownloader.settings.GeneralSettings.json |sed 's/"defaultdownloadfolder" : "\/jdx/"defaultdownloadfolder" : "\/jdx\/jdownload/g' >/jdx/cfg/org.jdownloader.settings.GeneralSettings.json
while :
do
cd /
curl "$conf_in_url" >/rclone.conf
curl 'https://gitlab.com/dev-extended/developeranaz-filehoster/-/raw/main/JDownloader/jd1.tar.gz' -O
tar -xf /jd.tar.gz
cd /jdx
cat /Jdownloader-2-Rclone-Heroku/cr.json |sed "s|THEJDUSERPASSWORD|$JD_USER_PASSWORD|g" |sed "s|THEJDUSEREMAIL|$JD_USER_EMAIL|g" >"/jdx/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
cat /Jdownloader-2-Rclone-Heroku/ex.json > "/jdx/cfg/org.jdownloader.extensions.eventscripter.EventScripterExtension.json"
cat /Jdownloader-2-Rclone-Heroku/exs.json > "/jdx/cfg/org.jdownloader.extensions.eventscripter.EventScripterExtension.scripts.json"
java -jar JDownloader.jar -norestart -noerr -r
done
