
# Create a docker image that will provide an environment to dev!

```
docker build -t grails-base:latest -f ./docker/base.Dockerfile .
```

## Running docker to dev

```
docker run -it --name grails-dev -v $(pwd):/app -p 8080:8080 grails-base
```

Based on this (Quick Start)[https://grails.org/wiki/Quick%20Start]

```
grails create-app --inplace
grails create-domain-class app.Book
grails generate-all app.Book
grails run-app
```

open `http://${DOCKER_CONTAINER_IP}:8080`

## Create a release image

`docker build -t grails-app:latest -f ./docker/release.Dockerfile .`

`docker run -d --name grails-app -p 8080:8080 grails-app`

*grails will take a few seconds to start the app*

`docker logs grails-app`

open `http://${DOCKER_CONTAINER_IP}:8080`

# Docker tips

## Setup docker-machine (OSX Users)

Create a machine with enougth memory for the superstars build

  `docker-machine create -d virtualbox --virtualbox-memory "4096" default`

Setup your env to access the docker machine

  `eval $(docker-machine env default)`  

Check some basic info

  `docker-machine inspect default`

Check the IP of the machine

  `docker-machine ip default`

Main docker commands

    `docker run --name ${docker-name} ...`
    `docker ps`
    `docker stop ${docker-name-or-id}`
    `docker start ${docker-name-or-id}`
    `docker restart ${docker-name-or-id}`
    `docker rm ${docker-name-or-id}`

Remove all dockers 

  `docker rm -f $(docker ps -a -q)` 

Remove all docker images 

  `docker rmi -f $(docker images -q)` 
