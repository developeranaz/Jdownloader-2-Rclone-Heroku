#!/bin/bash
echo "$PORT" >/PORT
rclone serve http ./ --addr=0.0.0.0:$(cat /PORT)
