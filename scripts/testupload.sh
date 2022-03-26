#!/bin/bash
curl "$conf_in_url" >/rclone.conf
firstremote=$(rclone listremotes --config=/rclone.conf |head -1 |sed 's/://g')
mkdir /home/uplist
rclone lsf -R /jdx >/home/uplist/initlist.txt
while :
do
         cat /home/uplist/initlist.txt | sed "s/^/- /g" >/home/uplist/minus.txt
         rclone lsf -R /jdx >/home/uplist/plist.txt #present list
         grep -v -x -f /home/uplist/plist.txt /home/uplist/initlist.txt | sed "s/^/+ /g" >/home/uplist/plus.txt
         cat /home/uplist/plus.txt /home/uplist/minus.txt >/home/uplist/filter.txt
         rclone copy --files-from /home/uplist/filter.txt /jdx "$firstremote":jd2rc --config=/rclone.conf
                 

         cat /home/uplist/plist.txt >>/home/uplist/initlist.txt 
         

#    ls -A >/home/uplist/cl2.txt
#    grep -v -x -f /home/uplist/cl1.txt /home/uplist/cl2.txt | sed "s/^/+ /g" >/home/uplist/filter.txt
#    cat /home/uplist/cl2.txt | sed "s/^/- /g" > 
#    rclone copy --include file.txt 
   
   
   

done
