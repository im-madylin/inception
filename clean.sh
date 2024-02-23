#!/bin/bash

docker stop $(docker ps -q -a)
docker rm $(docker ps -q -a)
docker rmi -f $(docker images -q -a)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q) 2>/dev/null
docker system prune -a -f

sudo rm -rf "/Users/ihahyeon/docker_volume/mariadb" #"/home/hahlee/data/mariadb"