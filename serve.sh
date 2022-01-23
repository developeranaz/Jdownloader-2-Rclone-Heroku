#!/bin/bash
echo "$PORT" >/PORT
curl 'https://raw.githubusercontent.com/developeranaz/Jdownloader-2-Rclone-Heroku/main/scripts/rclonealias.conf' >/alias.conf
rclone rcd --rc-serve --config=/alias.conf
