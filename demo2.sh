#!/usr/bin/env bash

DEMO_NAME="Docker Compose"

. _utils.sh

cd demo-compose
clear_screen


heading "List available images in repository 'docker-demo'"
echo_run docker images docker-demo

heading "List running containers"
echo_run docker ps

ask_continue "Build?"


heading "Build the image"
echo_run docker-compose build

heading "List available images in repository 'docker-demo':"
echo_run docker images docker-demo

ask_continue "Run?"


heading "Run the services"
echo_run docker-compose up -d

heading "List running containers"
echo_run docker ps

ask_continue "Open browser?"


open http://localhost:8000/

sleep 1
heading "Output containers logs"
echo_run docker logs docker-demo-v2-api
echo
echo_run docker logs --tail 200 docker-demo-v2-postgres

ask_continue "Clean?"


heading "Stop containers"
echo_run docker-compose stop

heading "List running containers"
echo_run docker ps

heading "List all containers"
echo_run docker ps -a

heading "Delete containers"
echo_run docker-compose rm --force

heading "List all containers"
echo_run docker ps -a

heading "Delete images"
echo_run docker rmi docker-demo:v2-api
echo
echo_run docker rmi docker-demo:v2-postgres

heading "List available images in repository 'docker-demo'"
echo_run docker images docker-demo

heading "Delete PostgreSQL files"
echo_command "rm -rf var/postgres/*"
rm -rf var/postgres/*


demo_over
cd ..
