#!/bin/bash

mv webapp/logs/nginx/access.log webapp/logs/nginx/access.log.`date +%Y%m%d%H%M%S`
mv webapp/logs/nginx/error.log webapp/logs/nginx/error.log.`date +%Y%m%d%H%M%S`

cd webapp
docker compose down
docker compose up
popd
