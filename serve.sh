#!/bin/bash
echo "$PORT" >/PORT
rclone rcd --rc-serve --rc-addr=0.0.0.0:$(cat /PORT)
