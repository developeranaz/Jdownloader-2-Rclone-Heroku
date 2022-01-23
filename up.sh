#!/bin/bash
curl "$conf_in_url" >/rclone.conf
firstremote=$(rclone listremotes --config=/rclone.conf |head -1 |sed 's/://g')

while getopts ":a:" opt; do
  case $opt in
    a)
      rclone copy /home/"$OPTARG" "$firstremote":jd2rc --config=/rclone.conf;
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
