#!/bin/bash
curl "$conf_in_url" >/rclone.conf

while getopts ":a:" opt; do
  case $opt in
    a)
      rclone copy "/jdx/jdownload/$OPTARG" "$(rclone listremotes --config=/rclone.conf |head -1)jd2rc" --config=/rclone.conf;
     # echo "$OPTARG" >/UOP
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
