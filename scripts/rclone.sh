#!/bin/bash
#VPS
rclone ls /jdx/downloads >/home/up_ed_list
while :
do
sleep 30
rclone ls /jdx/downloads >/home/up_list
grep -v -x -f /home/up_ed_list /home/up_list |sed 's/^ *//g' |sed '/\.part/d' >/home/up_ing_list
rclone _-
done
#--checkers 1 --transfers 1 --use-mmap --buffer-size 0M --tpslimit 1 --no-traverse
