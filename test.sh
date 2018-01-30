#!/bin/bash

set -x
set -e

docker-compose down
docker-compose build
docker-compose up &

while ! nc -z localhost 8081; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done

wrk -d 30 http://localhost:8081/ > results/$(date +"%Y%m%d-%H%M%S.txt")


docker-compose down
