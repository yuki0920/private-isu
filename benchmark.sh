#!/bin/bash

cd benchmarker
GATEWAY_IP=$(docker network inspect private-isu_my_network | jq -r '.[0].IPAM.Config[0].Gateway')

docker run --network host -i private-isu-benchmarker /bin/benchmarker -t http://$GATEWAY_IP -u /opt/userdata
