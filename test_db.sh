#!/bin/bash

# download the node modules
# npm install

# remove the container if exists or running 
if [ $(docker container ls -q -a --filter name=my_db) != '' ]; then
    docker container stop my_db
    docker container rm my_db
fi

# remove the image if exists
if [ $(docker image ls -q --filter reference=mydb) != '' ]; then
    docker image rm mydb
fi

# build the image
docker build . -t mydb

# start the container
docker container run -itd -p 8088:3306 --name my_db mydb