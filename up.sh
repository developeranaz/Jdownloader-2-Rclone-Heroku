#!/bin/bash
curl "$conf_in_url" >/rclone.conf
rclone copy /jdx 1su-mov-a:jd --config="/rclone.conf"
