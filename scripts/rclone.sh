#!/bin/bash

while :
do
sleep 10
|grep --colour 'DownloadCandidate:' |sed 's/DownloadCandidate:/\nFILE="/g' |sed 's/@/"\n/g' |grep 'FILE="' |sort -u |sed 's|$|; rclone copy "/jdx/jdownload/$FILE" "$(cat /remote)":jd2rc --config=/rclone.conf; rclone copy "/jdx/$FILE" "$(cat /remote)":jd2rc --config=/rclone.conf|g'
done
