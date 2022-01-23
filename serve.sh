#!/bin/bash
echo "$PORT" >/PORT
RPORT="$(cat /PORT)"
curl 'https://raw.githubusercontent.com/developeranaz/Jdownloader-2-Rclone-Heroku/main/scripts/rclonealias.conf' >/alias.conf
rclone rcd --rc-serve --config=/alias.conf --rc-addr=0.0.0.0:$RPORT
