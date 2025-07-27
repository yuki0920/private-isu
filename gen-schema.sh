#!/bin/bash

mysqldump -u root -proot -h 127.0.0.1 -P 3306 --no-data isuconp > schema.sql
