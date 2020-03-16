# Docker Tutorial

<https://www.docker.com>

- Create account
- Download docker

## Registries

Public Docker Registry:

`docker login -u <user> -p <pass>`

Private Azure Container Registry:

`az acr login --name <acrName>`

## Build & Run

### Build

`docker build [OPTIONS] PATH | URL | -`

Common Options:

- `-t` name and optional tag in the ‘name:tag’ format
  - name: `docker build -t myimage .`
  - name & tag: `docker build -t myimage:v12 .`
- `-f` file
  - `docker build -f Dockerfile.debug .`

Full list of options <https://docs.docker.com/engine/reference/commandline/build/>

### Run

`docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

Common Options:

- `-d` detached mode, run container in background
  - `docker run -d <IMAGE_NAME>`
  - use `docker ps` to list all containers
- `-e` set environment variables
  - `docker run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list <IMAGE_NAME>`
- `-p` expose port
  - `docker run -p 127.0.0.1:80:8080/tcp <IMAGE_NAME>`
  - binds port 8080 of the container to TCP port 80 on 127.0.0.1 of the host machine
- `--name` name the container
  - `docker run --name myContainer <IMAGE_NAME>`
- `-rm` remove the container when it exits
  - `docker run -rm <IMAGE_NAME>`

Full list of options <https://docs.docker.com/engine/reference/commandline/run/>

## Cleanup

Kill all running containers:

`docker kill $(docker ps -q)`

Delete all stopped containers:

`docker rm $(docker ps -a -q)`

Delete all images:

`docker rmi $(docker images -q)`

Remove unused data:

`docker system prune`

## Debug

Execute into a running container and run bash:

`docker exec -it <container> bash`

Get logs for running container:

`docker logs <container>`

Get logs for running container and follow the logs (i.e. session doesn't end till you hit CTRL + X):

`docker logs -f <container>`

Full list of options for exec <https://docs.docker.com/engine/reference/commandline/exec/>

Full list of options for logs <https://docs.docker.com/engine/reference/commandline/logs/>

## docker-compose

The Compose file is a YAML file defining services, networks and volumes. A service definition contains configuration that is applied to each container started for that service.

`docker-compose up`

`docker-compose down`

<https://docs.docker.com/compose/compose-file/>

## Useful Links

Guide for beginners: <https://docker-curriculum.com/>

Cheat Sheet: <https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf>

VS Code Extension: <https://code.visualstudio.com/docs/containers/overview>

ACR: <https://docs.microsoft.com/en-us/azure/container-registry/container-registry-authentication>
