#!/usr/bin/env bash

DEMO_NAME="Dockerfile"

. _utils.sh

cd demo-dockerfile
clear_screen


heading "List available images in repository 'docker-demo'"
echo_run docker images docker-demo

heading "List running containers"
echo_run docker ps

ask_continue "Build?"

heading "Build the image"
echo_run docker build -t docker-demo:v1 .

heading "List available images in repository 'docker-demo'"
echo_run docker images docker-demo

ask_continue "Run?"


heading "Run the container in detach mode mapping ports host:8000 to container:80"
echo_run docker run --detach --publish 8000:80 --name docker-demo-v1 docker-demo:v1

heading "List running containers"
echo_run docker ps

ask_continue "Open browser?"


open http://localhost:8000/

sleep 1
heading "Output container logs"
echo_run docker logs docker-demo-v1

ask_continue "Modify web page?"


heading "Modifying web page inside the container"
echo_command docker exec -i docker-demo-v1 sh \<\<-EOCMD
echo_command sed -i "s/Docker Demo v1/Docker Demo v1... Yeah!/" app.py
echo_command EOCMD
docker exec -i docker-demo-v1 sh <<-EOCMD
	sed -i "s/Docker Demo v1/Docker Demo v1... Yeah!/" app.py
EOCMD

action_required "Refresh your browser..."

ask_continue "Clean?"


heading "Stop container"
echo_run docker stop docker-demo-v1

heading "List running containers"
echo_run docker ps

heading "List all containers"
echo_run docker ps -a

heading "Delete container"
echo_run docker rm docker-demo-v1

heading "List all containers"
echo_run docker ps -a

heading "Delete image"
echo_run docker rmi docker-demo:v1

heading "List available images in repository 'docker-demo'"
echo_run docker images docker-demo


demo_over
cd ..
