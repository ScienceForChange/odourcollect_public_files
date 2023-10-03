#!/bin/bash

#run migrations if backend booted
for i in {1..5}
do
    #wait some time for backend container to boot up
    sleep 30

    # check if 'backend' container started successfully
    if [ "$(docker ps -a | grep backend)" ]
    then
        docker exec backend php artisan migrate
        echo "Migrations run successfully"
    else
        echo "Migrations did not run successfully, will retry one more time"
fi


