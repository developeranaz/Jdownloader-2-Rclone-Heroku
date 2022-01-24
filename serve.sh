#!/bin/bash
mkdir config
curl "$conf_in_url" >/config/rclone.conf
theremote="$(rclone listremotes --config=/config/rclone.conf |head -1)"
cat /Jdownloader-2-Rclone-Heroku/scripts/src/index.html |sed "s|THERCLONEREMOTE|$theremote|g" >/var/www/html/index.html
#VPS
echo "$PORT" >/PORT

cat /Jdownloader-2-Rclone-Heroku/scripts/nginxconf |sed "s/THERANDOMPORT/$(cat /PORT)/g" >/etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
RPORT="$(cat /PORT)"
curl 'https://raw.githubusercontent.com/developeranaz/Jdownloader-2-Rclone-Heroku/main/scripts/rclonealias.conf' >/alias.conf
rclone rcd --rc-serve --config=/alias.conf --rc-addr=0.0.0.0:$RPORT
