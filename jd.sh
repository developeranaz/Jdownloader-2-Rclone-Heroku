#!/bin/bash
while :
do
cd /
#!/bin/bash
fileid="1APyWX-f09aWwnwThjo-eKxu_uyPb3uvL"
filename="jd.tar.gz"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
cat /Jdownloader-2-Rclone-Heroku/cr.json |sed "s|THEJDUSERPASSWORD|$JD_USER_PASSWORD|g" |sed "s|THEJDUSEREMAIL|$JD_USER_EMAIL|g" >"/jdx/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
tar -xf /jd.tar.gz
cd /jdx
java -jar JDownloader.jar -norestart -noerr -r
done
