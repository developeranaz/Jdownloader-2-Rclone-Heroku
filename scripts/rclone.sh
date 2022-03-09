#!/bin/bash
#VPS
rclone ls /jdx/downloads >/home/up_ed_list
while :
do
sleep 30
rclone ls /jdx/downloads >/home/up_list
grep -v -x -f /home/up_ed_list /home/up_list |sed 's/^ *//g' |sed '/\.part/d' >/home/up_ing_list
cat /home/up_ing_list |sed 's/^/+ /g'>/home/uploading_list
rclone copy /jdx/downloads $(cat /remote): --filter-from=/home/uploading_list --checkers 1 --transfers 1 --use-mmap --buffer-size 0M --tpslimit 1 --no-traverse --config=/rclone.conf
cat /home/up_ing_list >>/home/up_ed_list
done
#--checkers 1 --transfers 1 --use-mmap --buffer-size 0M --tpslimit 1 --no-traverse
