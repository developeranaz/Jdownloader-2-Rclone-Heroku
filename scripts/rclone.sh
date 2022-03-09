#!/bin/bash
#VPS
while :
do
sleep 30
thelog="$(ls /jdx/logs |grep '2022' |tail -1)"
cat /jdx/logs/"$thelog"/* |grep 'DownloadCandidate:' |sed 's/DownloadCandidate:/\nFILE="/g' |sed 's/@/"\n/g' |grep 'FILE="' |sort -u |sed 's|$|; rclone copy "/jdx/jdownload/$FILE" "$(cat /remote)":jd2rc --config=/rclone.conf --checkers 1 --transfers 1 --use-mmap --buffer-size 0M --tpslimit 1 --no-traverse; rclone copy "/jdx/$FILE" "$(cat /remote)":jd2rc --config=/rclone.conf --checkers 1 --transfers 1 --use-mmap --buffer-size 0M --tpslimit 1 --no-traverse|g' |sed '/FILE=" ; rclone/d' |bash
done
#--checkers 1 --transfers 1 --use-mmap --buffer-size 0M --tpslimit 1 --no-traverse
