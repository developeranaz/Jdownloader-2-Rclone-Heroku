#!/bin/bash
#VPS
echo "$PORT" >/PORT

cat /Jdownloader-2-Rclone-Heroku/scripts/nginxconf |sed "s/THERANDOMPORT/$(cat /PORT)/g" >/etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
RPORT="$(cat /PORT)"
curl 'https://raw.githubusercontent.com/developeranaz/Jdownloader-2-Rclone-Heroku/main/scripts/rclonealias.conf' >/alias.conf
rclone rcd --rc-serve --config=/alias.conf --rc-addr=0.0.0.0:$RPORT
