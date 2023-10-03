#!/bin/bash

#pull newest frontend code
cd ~/server/OdourCollect_2.0_frontend
git switch develop
git pull

#pull newest backend code
cd ~/server/OdourCollect_2.0_backend
git switch develop
git pull

#remove all containers
docker stop $(docker ps -a -q)
docker remove $(docker ps -a -q)

#remove all images
docker rmi $(docker images -q)

#remove all volumes
docker volume rm $(docker volume ls -q)

#run cocker compose up
cd ~/server
docker compose up

