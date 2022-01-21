#!/bin/bash
curl "$conf_in_url" >/rclone.conf
rclone copy /jdx devanaz:
