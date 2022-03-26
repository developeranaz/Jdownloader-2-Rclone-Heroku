#!/bin/bash
mkdir /home/uplist
ls -A >/home/uplist/cl1.txt
while :
do
   ls -A >/home/uplist/cl2.txt
   grep -v -x -f /home/uplist/cl1.txt /home/uplist/cl2.txt >/home/uplist/filter.txt
   cat /home/uplist/cl2.txt /home/uplist/cl1.txt >>/home/uplist/blacklist.txt
   cat /home/uplist/blacklist.txt >/home/uplist/cl2.txt
#   rclone copy ......
   
   
   

done
