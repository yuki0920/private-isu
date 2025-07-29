#!/bin/bash

cd benchmarker
docker run --network host -i private-isu-benchmarker /bin/benchmarker -t http://192.168.192.1 -u /opt/userdata
