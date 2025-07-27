#!/bin/bash

cd benchmarker
docker run --network host -i private-isu-benchmarker /bin/benchmarker -t http://172.20.0.1 -u /opt/userdata
