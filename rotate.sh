#!/bin/bash

mv webapp/logs/nginx/access.log webapp/logs/nginx/access.log.`date +%Y%m%d%H%M%S`
mv webapp/logs/nginx/error.log webapp/logs/nginx/error.log.`date +%Y%m%d%H%M%S`
mv webapp/logs/mysql/mysql-slow.log webapp/logs/mysql/mysql-slow.log.`date +%Y%m%d%H%M%S`

cd webapp
rm -rf public/image/*
docker compose down
docker compose up --build
popd
