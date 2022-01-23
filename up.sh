#!/bin/bash
curl "$conf_in_url" >/rclone.conf
firstremote=$(rclone listremotes --config=/rclone.conf |head -1 |sed 's/://g')

while getopts ":a:" opt; do
  case $opt in
    a)
      curl -L "$PINGBOT+$OPTARG"
      file1=$(ls /home |grep $OPTARG |head -1)
      file2=$(ls /jdx |grep $OPTARG |head -1)
      rclone copy /home/"$file1" "$firstremote":jd2rc --config=/rclone.conf;
      rclone copy /home/"$file2" "$firstremote":jd2rc --config=/rclone.conf;
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done
