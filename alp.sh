#!/bin/bash

alp json --sort sum -r -m "/posts/[0-9]+,/@\w+,image/\d+" -o count,method,uri,min,avg,max,sum  < webapp/logs/nginx/access.log
