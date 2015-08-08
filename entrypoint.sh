#!/bin/bash

nginx -p /app -c conf/nginx.conf
tail -f logs/error.log -f logs/access.log
